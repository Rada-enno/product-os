# Product Strategy Agent — Example Interaction

## Invocation
```
/product-strategy Add GS1 Barcode Verification to the Linear roadmap.
Customer: Cargill. This is a NOW-Flex feature for Q2/Q3 2026.
```

---

## Step 1 — Check Existing Roadmap

```
list_projects: query = "barcode"
→ No matching projects found. Proceeding to draft.
```

---

## Step 2 — Draft Presented to Human ✋

```
== LINEAR PROJECT DRAFT ==
Name:       GS1 Barcode Verification
Team:       Product
Initiative: Product Sprint 2026
Priority:   High
Bucket:     🟡 NOW-Flex — Late Q2 / Early Q3 2026
Start Date: 2026-04-02
Target Date: 2026-09-30
Lead:       me

Summary (max 255 chars):
  Validate GS1 barcodes on product packaging via Ennteract — decode barcode
  data and flag mismatches against onboarded product reference.

Description preview:
---
🟡 NOW-Flex — Late Q2 / Early Q3 2026

Category: Revenue | Bucket: Net new product
Sprint Estimate: 2–3 product sprints

Customer Signal: Cargill (existing) — requested for food packaging line.

Use Cases: GS1-128 / EAN-13 validation, mismatch flagging, decoded field
display on scan result.

Part of Product Sprint 2026 initiative.
---

⚠️  Approve to create in Linear, or reply with edits.
==========================
```

---

## Human Reply
```
GO — but change priority to Medium, Cargill hasn't confirmed timeline yet.
```

---

## Step 3 — Execute

```
save_project:
  name: "GS1 Barcode Verification"
  addTeams: ["Product"]
  priority: 3  (Medium)
  startDate: "2026-04-02"
  targetDate: "2026-09-30"
  description: [as drafted]

→ Created: https://linear.app/ennoventure/project/gs1-barcode-verification-...
```

---

## Step 4 — Output Report ✋

```
== PRODUCT STRATEGY COMPLETE ==
Linear Project: GS1 Barcode Verification
               https://linear.app/ennoventure/project/gs1-barcode-verification-...
Bucket:         🟡 NOW-Flex
Priority:       Medium (updated per your instruction)
Milestones:     0 (none requested)

⚠️  Roadmap updated. Recommend revisiting priority once Cargill confirms timeline.
================================
```
