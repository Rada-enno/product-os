# UX Designer Agent — Example Interaction

## Invocation
```
/ux-designer Create a FigJam flow for the Text Extraction (Nebula) feature —
show the two modes: live scan on VYU and on-demand extraction on Ennteract.
```

---

## Step 1 — Understand the Request

- Type: Flow diagram (FigJam)
- Two flows needed: VYU live scan + Ennteract on-demand
- No existing Figma URL provided — creating new FigJam board

---

## Step 2 — Design Brief Presented to Human ✋

```
== UX DESIGN BRIEF ==
Type:    FigJam flow diagram
Feature: Text Extraction (Nebula)
Scope:
  Flow 1 — Live VYU Scan
    Step 1: User opens VYU and scans product
    Step 2: Authentication result shown
    Step 3: Extracted text panel shown below result (brand, batch, license)
    Step 4: User taps to copy a field or the full text block

  Flow 2 — On-Demand Ennteract
    Step 1: User opens an image on Ennteract
    Step 2: User clicks "Extract Text" button
    Step 3: Extraction runs (~2–3 sec indicator)
    Step 4: Extracted text panel appears
    Step 5: User copies field or exports via CSV

Key interactions to show:
  - Text panel with matched (green) / mismatched (red) field highlighting
  - Copy action on individual fields
  - CSV export trigger

FigJam destination: New board — "Nebula — Text Extraction Flow"

⚠️  Approve to create in FigJam, or reply with scope changes.
=====================
```

---

## Human Reply
```
GO — also add a third flow showing the Delivery team onboarding reference text.
```

---

## PM Agent Relay (if via PM Agent)

```
Clarification received:
Question: Scope of FigJam diagram
Answer: Add Flow 3 — Delivery team onboarding reference text
Please resume from where you were blocked.
```

---

## Step 3 — Execute

```
generate_diagram:
  type: "flow"
  title: "Nebula — Text Extraction Flow"
  flows: [Flow 1: VYU Live Scan, Flow 2: Ennteract On-Demand, Flow 3: Delivery Onboarding]

→ FigJam board created: https://www.figma.com/board/[fileKey]/Nebula-Text-Extraction-Flow
```

---

## Step 4 — Output Report ✋

```
== UX DESIGNER COMPLETE ==
FigJam board: Nebula — Text Extraction Flow
              https://www.figma.com/board/[fileKey]/Nebula-Text-Extraction-Flow
Flows:        3 (VYU Live Scan, Ennteract On-Demand, Delivery Onboarding)
Notes:        Text panel UI design (green/red highlighting) to be designed
              separately as a wireframe once flow is approved.

⚠️  Please review the flow and confirm it matches the expected user journey
    before sharing with engineering.
==========================
```
