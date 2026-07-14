# Kudos COE Dashboard - one-click public share (local server + Cloudflare tunnel)
$dir = $PSScriptRoot

Write-Host "Starting local server on http://localhost:8000/ ..." -ForegroundColor Cyan
$up = $false
try { $up = (Invoke-WebRequest http://localhost:8000/ -UseBasicParsing -TimeoutSec 3).StatusCode -eq 200 } catch {}
if (-not $up) {
  Start-Process python -ArgumentList "-m","http.server","8000","--directory",$dir -WindowStyle Hidden
  Start-Sleep -Seconds 2
}

Write-Host "Opening public tunnel (takes about 10 seconds)..." -ForegroundColor Cyan
$log = Join-Path $dir "cloudflared.log"
$out = Join-Path $dir "cloudflared.out"
if (Test-Path $log) { Remove-Item $log -Force }
$proc = Start-Process cloudflared -ArgumentList 'tunnel','--url','http://localhost:8000' `
        -RedirectStandardError $log -RedirectStandardOutput $out -WindowStyle Hidden -PassThru

$url = $null
for ($i = 0; $i -lt 25; $i++) {
  Start-Sleep -Seconds 1
  foreach ($f in @($log, $out)) {
    if (Test-Path $f) {
      $m = Select-String -Path $f -Pattern 'https://[a-z0-9-]+\.trycloudflare\.com' -AllMatches -ErrorAction SilentlyContinue | Select-Object -First 1
      if ($m) { $url = $m.Matches[0].Value; break }
    }
  }
  if ($url) { break }
}

Write-Host ""
if ($url) {
  try { Set-Clipboard $url } catch {}
  Start-Process $url
  Write-Host "=====================================================" -ForegroundColor Green
  Write-Host "  PUBLIC LINK (already copied to your clipboard):" -ForegroundColor Green
  Write-Host "  $url" -ForegroundColor Yellow
  Write-Host "=====================================================" -ForegroundColor Green
  Write-Host ""
  Write-Host "  Paste it to Matias. Keep THIS window open during the demo." -ForegroundColor Green
  Write-Host "  Close this window (or press Ctrl+C) to STOP sharing." -ForegroundColor DarkGray
} else {
  Write-Host "Could not get a URL. Check $log" -ForegroundColor Red
}
Wait-Process -Id $proc.Id
