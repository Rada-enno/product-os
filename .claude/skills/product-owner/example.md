# Product Owner Agent — Example Interaction

## Invocation
```
/product-owner Create a Jira Epic for the GS1 Barcode Verification feature.
Customer: Cargill (existing). The feature lets clients validate GS1 barcodes
on packaging via Ennteract.
```

---

## Step 1 — Check for Existing Items

```
searchJiraIssuesUsingJql: project = ENL AND summary ~ "barcode" ORDER BY created DESC
→ No matching Epics found. Proceeding to draft.
```

---

## Step 2 — Draft Presented to Human ✋

```
== JIRA EPIC DRAFT ==
Project: ENL
Type: Epic
Summary: GS1 Barcode Verification — Validate barcodes on product packaging via Ennteract

Description:

## Overview
GS1 Barcode Verification enables clients to validate GS1 barcodes printed on
product packaging — confirming the barcode is correctly formatted, maps to the
right product, and matches the onboarded reference.

## Problem
- Clients currently have no way to validate barcode data on packaging via Ennteract
- Misprinted or incorrect barcodes go undetected until they cause downstream issues
  (retailer rejection, scan failures at point of sale)
- No structured link between barcode data and Ennoventure's authentication record

## Customer Signals
- **Cargill** (Existing): Requested barcode validation for their food packaging line

## Solution
- During scan: decode and display GS1 barcode data on the VYU result screen
- On Ennteract: validate barcode against onboarded reference per product/SKU

## Use Cases (MVP)
- Validate GS1-128 and EAN-13 barcodes on food packaging
- Flag barcodes that don't match the onboarded product reference
- Display decoded barcode fields (GTIN, batch, expiry) on scan result

## Related
- PRD: docs/prds/ (to be created)
- Related: ENL-4675 (Text Extraction / Nebula — similar pattern)

---
⚠️  Approve to create in Jira, or reply with edits.
====================
```

---

## Human Reply
```
GO
```

---

## Step 3 — Execute

```
createJiraIssue:
  projectKey: ENL
  issueTypeName: Epic
  summary: "GS1 Barcode Verification — Validate barcodes on product packaging via Ennteract"
  description: [as drafted above]
  additional_fields: { customfield_10107: { id: "10369" } }

→ Created: ENL-4701
```

---

## Step 4 — Output Report ✋

```
== PRODUCT OWNER COMPLETE ==
Jira Epic:  ENL-4701 — https://ennoventure-tech.atlassian.net/browse/ENL-4701
Status:     Open / To Do

⚠️  Please review. Confluence page creation is next — confirm when ready.
============================
```

---

## Key Pattern to Note

The Jira description is **under 200 words**. It contains:
- One-line overview
- 3 specific problem bullets (not generic)
- Named customer signal
- Solution in 2 bullets
- 3 scoped MVP use cases
- Related links

No TAM tables, no architecture diagrams, no success metrics — those live in the PRD.
