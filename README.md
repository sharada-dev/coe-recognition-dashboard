# Kudos — COE Recognition & Visibility Dashboard

A clickable **v1 mockup** of an internal recognition tool for the India / Brazil Commerce COE
(Developers, Tech Leads, Architects). It gives every COE member a self-service way to log and
showcase noteworthy work — a feature, a certification, client praise, or a technical idea — so
good work is visible beyond a single manager, and so appraisal conversations are backed by a
running, evidenced record instead of memory.

> **Status:** interactive prototype for stakeholder review — not a production build.
> The data is in-memory sample data; nothing is persisted.

## Why this exists

Today, visibility into an individual's strong work is filtered almost entirely through their
direct manager, and appraisals happen only once a year. That creates two problems: good work
goes unseen by the wider COE, and rating mismatches surface too late to course-correct. This
dashboard is a lightweight **evidence + visibility layer** — explicitly *not* a replacement for
the formal appraisal process.

## What's in the mockup (P0 scope)

| View | What it does |
| --- | --- |
| **New Entry** | Submission form — Title, Category, Description, Evidence link, Self-tag, Quarter. Required-field validation + inline nudges when evidence/tag are left blank. |
| **COE Feed** | Chronological, COE-wide feed with combinable filters (person / category / quarter / self-tag), plus KPI tiles tied to the success metrics. |
| **My Entries** | A contributor's own history, editable and deletable by the author only. |
| **Manager Digest** | A manager's reports grouped by person, with **Rating support** and **TL case** entries pulled to the top and "Just sharing" dimmed. |
| **Endorsements** | One-click peer endorsement (toggle), visible count and endorsers; you can't endorse your own entry. |

### Key concepts
- **Self-tag** — the contributor's own label for an entry: *Just sharing*, *Rating support*
  (count this toward my rating), or *TL case* (evidence toward my Tech Lead promotion).
- **Endorse** — a lightweight "I vouch for this" from a peer/TL; turns a self-claim into a
  peer-backed signal without a heavy approval flow.

### KPI tiles (mapped to the PRD success metrics)
- **Adoption** — % of active COE members who posted ≥1 entry this quarter (goal ≥50%).
- **Endorsement rate** — % of entries with ≥1 peer endorsement (goal ≥30%).
- **Flagged for appraisal** — count of Rating-support + TL-case entries queued for review.

## Run it locally

It's a single self-contained HTML file (all CSS/JS inlined, zero external dependencies).

**Option A — just open it:** double-click `index.html`.

**Option B — local server (nicer URL for demos):**
```bash
python -m http.server 8000
# then open http://localhost:8000/
```
On Windows you can also double-click **`start-demo.bat`**, which starts the server and opens the
browser for you.

## Design notes
- **Identity:** a "certificate of merit / seal" direction — deep pine + antique gold, with gold
  reserved only for the appraisal-critical *Rating support* flag and endorsements. Deliberately
  avoids a gamified / leaderboard look (a non-goal in the PRD).
- **Information design:** importance is encoded in *form*, not just color — filled pills for
  self-tags, quiet outline chips for categories — so it stays legible and colorblind-safe.
- **Themes:** full light + dark support, toggle in the top bar.

## Not included (deliberately)
Per the PRD, P1/P2 items are held back until the core loop proves out: GitHub link enrichment,
weekly email digests, export-to-PDF, analytics, and deeper HR/GitHub API integrations.

---
*Built as a review artifact for the COE Recognition Dashboard PRD (v1).*
