# PRD Writer Agent — Example Interaction

## Invocation
```
/prd-writer Write the PRD for Text Extraction (Nebula). Jira: ENL-4675.
Linear: https://linear.app/ennoventure/project/text-extraction-nebula-...
Customer signals: Ferrero (prospective), Denso (existing, ENL-4400).
Research doc: /Nebula/Nebula_Project_Writeup.docx
```

---

## Step 1 — Input Check

- [x] Problem statement — from research doc
- [x] Customer signals — Ferrero, Denso (ENL-4400)
- [x] Jira Epic — ENL-4675
- [x] Linear — provided
- [ ] TAM data — need to derive from research + competitive context
- [x] Technical context — Nebula writeup

All inputs available. Proceeding to TAM review.

---

## Gate 1 — TAM & Revenue Review ✋

```
== TAM & REVENUE REVIEW ==
Market segments:
  Anti-counterfeiting software/platforms: ~$1.8–2.5B (2024), 14–16% CAGR
  Automotive aftermarket auth-tech:       ~$300–500M, growing post-COVID
  Loyalty via pack OCR:                   ~$0 today (pure greenfield)

Ennoventure SAM (Year 1): ~$200–400K ARR (Ferrero + Denso tier)
Ennoventure SAM (Year 3): ~$2–5M ARR as feature rolls into standard tiers

Key whitespace: No competitor offers mobile OCR from pack artwork as a
consumer-facing product. Systech/Videojet = factory hardware only.

Revenue model:
  Artwork / batch text validation → per artwork onboarded
  Loyalty code auto-capture       → per SKU (monthly)
  Print quality validation        → per SKU (monthly)
  [Supply chain descoped for MVP]

Customer signals:
  Ferrero: evaluating for authentication + batch validation (prospective)
  Denso:   scratch-off loyalty codes, Argentina Oct 2026, ~100K labels

⚠️  Approve to proceed to full PRD, or reply with corrections.
==========================
```

---

## Human Reply
```
GO — looks right. Keep supply chain descoped.
```

---

## Gate 2 — PRD Draft Summary ✋

```
== PRD DRAFT READY ==
File: docs/prds/2026-04-02-text-extraction.md
Sections completed:
  ✅ Who Is This For (user table)
  ✅ Problem Statement
  ✅ Market Opportunity (industry-specific TAM)
  ✅ Key Customer Signals
  ✅ Revenue Model
  ✅ Goals (2 extraction modes)
  ✅ Non-Goals
  ✅ User Stories (Brand Manager, Loyalty Manager, Delivery Team)
  ✅ Functional Requirements (product-facing, not technical)
  ✅ Non-Functional Requirements (latency + accuracy only)
  ✅ Success Metrics (CER, recall, adoption)
  ✅ MVP Deliverables (3 items)
  ✅ Risks & Mitigations
  ✅ Open Questions
  ✅ Next Phase plan

Links embedded:
  Jira:   ENL-4675
  Linear: https://linear.app/ennoventure/project/text-extraction-nebula-...

⚠️  Review the file, then reply PUBLISH to sync to Confluence,
    or reply with specific section edits.
=====================
```

---

## Human Reply
```
PUBLISH
```

---

## Gate 3 — Output Report ✋

```
== PRD WRITER COMPLETE ==
GitHub:     docs/prds/2026-04-02-text-extraction.md
Confluence: [2026-04-02] Text Extraction (Nebula) — PRD
            https://ennoventure-tech.atlassian.net/wiki/spaces/PT/pages/1579024390
Status:     Draft

⚠️  PRD is live. Update status to Reviewed once stakeholder comments are
    incorporated (use inline Confluence comments for feedback).
=========================
```

---

## Key Pattern to Note

The 3-gate structure keeps the human in control at each decision point:
1. **TAM/revenue framing** — approved before writing begins
2. **Full draft** — approved before publishing anywhere
3. **Published output** — confirmed with links before session closes
