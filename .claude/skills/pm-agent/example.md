# PM Agent — Example Interaction

## Invocation
```
/pm-agent We want to add a barcode verification feature to Ennteract so clients can
validate GS1 barcodes on their packaging alongside our existing authentication.
```

---

## Step 1 — Brainstorm (internal)
- Intent: new detection/validation capability on packaging
- Adjacent to Nebula (text extraction) — both read machine-readable content from pack
- Routing: Feature Request → Product Owner (primary), PRD Writer, Product Strategy
- Gap: no mention of specific customer demand — need to probe
- Risk: scope overlap with existing barcode scanning in VYU app

---

## Step 2 — Standup Brief Presented to Human

```
== STANDUP BRIEF ==
Input: GS1 barcode verification on Ennteract — validate barcodes on packaging
Classification: Feature Request

Agents:
  Product Owner (Primary)
  Task: Create Jira Epic for GS1 Barcode Verification
  Output: ENL project Epic

  PRD Writer (Supporting)
  Task: Write PRD — problem, user stories, FRs, success metrics
  Output: docs/prds/2026-04-02-barcode-verification.md + Confluence

  Product Strategy (Supporting)
  Task: Add to Linear roadmap, assess priority vs current NOW bucket
  Output: Linear project

Before proceeding — one clarification needed:
  Is there an existing customer requesting this, or is this exploratory?

⚠️  Reply STOP to hold. Reply GO (with answer to clarification) to proceed.
==================
```

---

## Human Reply
```
GO — Cargill has asked for this specifically for their food packaging line.
```

---

## Step 3 — Execution (agents spawned in parallel)

PM Agent relays Cargill signal to all agents and spawns:
- Product Owner → creates ENL epic
- PRD Writer → writes PRD with Cargill as primary customer signal
- Product Strategy → adds to Linear under NOW-Flex

---

## Step 4 — Status Check (after ~2 agent turns)

```
== STATUS CHECK ==
Product Owner:    ✅ ENL-4701 created → https://ennoventure-tech.atlassian.net/browse/ENL-4701
PRD Writer:       🔄 In progress — TAM review presented, awaiting your approval
Product Strategy: ✅ Linear project created → https://linear.app/ennoventure/...
=================
```

---

## Step 5 — Closing Summary

```
== SESSION SUMMARY ==
Feature: GS1 Barcode Verification
Outputs:
  - Jira Epic:  ENL-4701
  - PRD:        docs/prds/2026-04-02-barcode-verification.md + Confluence
  - Linear:     https://linear.app/ennoventure/project/barcode-verification-...
Open Items:
  - [ ] PRD TAM section awaiting your approval (PRD Writer paused at Gate 1)
=====================
```
