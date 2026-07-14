# Karya (कार्य) — McFadyen COE Recognition & Visibility Dashboard

**Karya** (Sanskrit/Hindi for *work / deed*) is a clickable **v1 mockup** of an internal
recognition tool for the McFadyen **India / Brazil Commerce COE** (Developers, Tech Leads,
Architects). It gives every COE member a self-service way to log and showcase noteworthy work —
a feature, a certification, client praise, or a technical idea — so good work is visible beyond a
single manager, and so appraisal conversations are backed by a running, evidenced record instead
of memory.

> **Status:** interactive prototype for stakeholder review — not a production build.
> The data is in-memory sample data; nothing is persisted.

## Why this exists

Today, visibility into an individual's strong work is filtered almost entirely through their
direct manager, and appraisals happen only once a year. That creates two problems: good work
goes unseen by the wider COE, and rating mismatches surface too late to course-correct. Karya is
a lightweight **evidence + visibility layer** — explicitly *not* a replacement for the formal
appraisal process.

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

It's a single HTML file (`index.html`) plus the McFadyen logo (`mcf-logo.png`).

**Option A — just open it:** double-click `index.html`.

**Option B — local server (nicer URL for demos):**
```bash
python -m http.server 8000
# then open http://localhost:8000/
```
On Windows you can also double-click **`share-demo.bat`** to expose it publicly via a Cloudflare
tunnel for a live demo.

## Design notes
- **Brand:** aligned to **McFadyen Digital** — signature red `#E00000`, charcoal `#313131`,
  cool-grey grounds, and the **Raleway** typeface. The McFadyen logo appears in the top bar and
  footer.
- **Information design:** importance is encoded in *form + colour* — a **red** "Rating support"
  pill (appraisal-critical) vs a **charcoal** "TL case" pill (promotion track) vs a quiet grey
  "Just sharing" pill — so what needs attention reads at a glance.
- **Themes:** full light + dark support, toggle in the top bar.

## Not included (deliberately)
Per the PRD, P1/P2 items are held back until the core loop proves out: GitHub link enrichment,
weekly email digests, export-to-doc, analytics, and deeper HR/GitHub API integrations.

---
*Built as a review artifact for the COE Recognition Dashboard PRD (v1). "McFadyen" and the
McFadyen Digital logo are trademarks of McFadyen Digital, used here for an internal company tool.*
