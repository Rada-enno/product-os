# Analytics Agent — Example Interaction

## Invocation
```
/analytics-agent Define PostHog tracking events for the Text Extraction (Nebula)
feature. Two modes: live VYU scan and on-demand Ennteract extraction.
Key actions: trigger extraction, view text, copy field, export CSV.
```

---

## Step 1 — Switch Project + Check Existing Events

```
projects-get → Active project: Ennoventure Production ✅

event-definitions-list → Search for: "text", "extract", "scan", "export"
→ Found: scan_completed, scan_failed (existing)
→ No text extraction events exist. Proceeding to draft.
```

---

## Gate 1 — Event Schema Draft ✋

```
== ANALYTICS EVENT DRAFT ==
Feature: Text Extraction (Nebula)
PostHog project: Ennoventure Production

Proposed events:

  Event: `text_extraction_triggered`
  Trigger: User initiates text extraction (either via live scan or on-demand)
  Properties:
    mode          (string):  "live_scan" | "on_demand"
    product_id    (string):  Internal product/SKU identifier
    client_id     (string):  Ennoventure client account ID
    image_quality (string):  "high" | "medium" | "low" (from blur score)

  Event: `text_extraction_completed`
  Trigger: OCR engine returns results successfully
  Properties:
    mode             (string):  "live_scan" | "on_demand"
    fields_extracted (number):  Count of fields identified
    has_mismatch     (boolean): Whether any field differs from reference
    latency_ms       (number):  Time from trigger to result in ms
    product_id       (string):  SKU identifier

  Event: `text_extraction_failed`
  Trigger: OCR engine returns error or below-quality-threshold result
  Properties:
    mode         (string): "live_scan" | "on_demand"
    failure_reason (string): "low_quality_image" | "engine_error" | "timeout"
    product_id   (string): SKU identifier

  Event: `text_field_copied`
  Trigger: User taps copy on an individual extracted field
  Properties:
    field_name  (string): e.g. "brand_name", "batch_code", "license_number"
    product_id  (string): SKU identifier

  Event: `text_extraction_exported`
  Trigger: User exports extracted text via CSV from Ennteract
  Properties:
    export_format (string): "csv"
    record_count  (number): Number of extraction records exported
    client_id     (string): Ennoventure client account ID

Proposed funnels:
  Adoption funnel: text_extraction_triggered → text_extraction_completed → text_field_copied
  Export funnel:   text_extraction_triggered → text_extraction_completed → text_extraction_exported

Existing events that overlap:
  scan_completed: fires after authentication result — text_extraction_triggered
                  should fire after this in live_scan mode (not replace it)

⚠️  Approve to write event definitions file and create PostHog funnels,
    or reply with changes.
==========================
```

---

## Human Reply
```
GO — also add a property for whether the extraction was on a reference-onboarded
product or not.
```

---

## Step 3 — Execute

After incorporating the feedback (adding `has_reference` boolean to `text_extraction_triggered` and `text_extraction_completed`):

```
Write: docs/analytics/2026-04-02-text-extraction-events.md ✅

insight-create-from-query:
  → Adoption funnel: triggered → completed → copied
  → Export funnel: triggered → completed → exported

→ 2 PostHog insights created
```

---

## Gate 3 — Output Report ✋

```
== ANALYTICS AGENT COMPLETE ==
Event definitions: docs/analytics/2026-04-02-text-extraction-events.md
Events defined:    5
PostHog insights:  2 (Adoption funnel, Export funnel)
Feature flags:     None

⚠️  Review event names with engineering before instrumentation.
    Confirm `product_id` maps to Ennoventure's internal SKU identifier format.
==============================
```
