# GTM Manager Agent — Example Interaction

## Invocation
```
/gtm-manager Draft the GTM plan for Text Extraction (Nebula).
PRD: docs/prds/2026-04-02-text-extraction.md
Key customers: Ferrero (prospective), Denso (existing, Argentina Oct 2026).
```

---

## Step 1 — Input Check

- [x] Feature name + brief — Text Extraction (Nebula)
- [x] Target audience — FMCG brands, automotive aftermarket
- [x] Customer pipeline — Ferrero (prospective), Denso (Oct 2026 go-live)
- [x] PRD link — provided
- [x] Hard deadline — Denso Argentina launch, October 2026
- [ ] Pricing — not confirmed yet

Flagging pricing gap but proceeding with draft — pricing can be refined.

---

## Gate 1 — Launch Strategy Outline ✋

```
== GTM STRATEGY OUTLINE ==
Feature: Text Extraction (Nebula)
Target market: FMCG + Automotive aftermarket brands on Ennoventure platform

Launch phases:

  Phase 1 — Internal Alpha (May–Jun 2026)
    Audience: Ennoventure Delivery team + 1 internal test account
    Timeline: 4–6 weeks post model integration
    Success criteria: CER ≤5% on 3 test product artworks; no pipeline regressions

  Phase 2 — Pilot (Jul–Sep 2026)
    Audience: Denso (loyalty use case, Argentina), Ferrero (auth use case)
    Timeline: Live by Sep 2026 — 4 weeks before Denso's Oct go-live
    Success criteria: Denso loyalty flow working end-to-end; Ferrero validation
                      demo approved by client

  Phase 3 — General Availability (Oct 2026+)
    Audience: All Ennoventure clients on Ennteract
    Timeline: Oct 2026 alongside Denso launch
    Pricing: Per artwork + per SKU tiers (to be confirmed)

Communication plan:
  Internal briefing    → Delivery + CS teams         → Jun 2026
  Denso pilot comms    → Account manager → Denso PM   → Jul 2026
  Ferrero demo         → Sales + Product              → Aug 2026
  GA announcement      → Email + in-product nudge     → Oct 2026

Rollback trigger: If CER >10% on pilot client artworks after 2 tuning cycles,
                  pause GA and extend pilot phase.

⚠️  Approve to write full GTM plan, or reply with changes.
==========================
```

---

## Human Reply
```
GO — but push Phase 3 to November, we need September for Denso stabilisation.
```

---

## Gate 2 — Full GTM Draft Summary ✋

```
== GTM DRAFT READY ==
File: docs/gtm/2026-04-02-text-extraction-gtm.md
Sections completed:
  ✅ Launch Summary
  ✅ Target Audience (FMCG + Automotive)
  ✅ Phase 1 — Internal Alpha (May–Jun 2026)
  ✅ Phase 2 — Pilot: Denso + Ferrero (Jul–Sep 2026)
  ✅ Phase 3 — GA (Nov 2026, updated per your instruction)
  ✅ Communication Plan
  ✅ Rollback Plan

Note: Pricing left as TBD — recommend confirming per-artwork and per-SKU
      rates before Phase 3 comms go out.

⚠️  Reply PUBLISH to sync to Confluence, or reply with edits.
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
== GTM MANAGER COMPLETE ==
GitHub:     docs/gtm/2026-04-02-text-extraction-gtm.md
Confluence: [2026-04-02] Text Extraction (Nebula) — GTM Plan
            https://ennoventure-tech.atlassian.net/wiki/spaces/PT/pages/[id]
Status:     Draft

⚠️  Share with Sales and CS for input before Phase 2 comms begin.
    Pricing confirmation needed before GA communication goes out.
==========================
```
