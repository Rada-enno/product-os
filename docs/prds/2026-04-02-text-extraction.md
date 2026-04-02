# PRD: Text Extraction
**Date:** 2026-04-02
**Author:** PRD Writer Agent
**Internal Codename:** Nebula
**Status:** Draft
**Jira Epic:** [ENL-4675](https://ennoventure-tech.atlassian.net/browse/ENL-4675)
**Linear:** [Text Extraction (Nebula)](https://linear.app/ennoventure/project/text-extraction-nebula-821d56e864f9)
**Confluence:** https://ennoventure-tech.atlassian.net/wiki/spaces/PT/pages/1579024390

---

## Problem Statement

Brands using Ennoventure's Sentinel pipeline today rely entirely on visual artwork features (pixel-level classification, pattern matching) to detect counterfeits and validate products. This creates a blind spot: text-based counterfeits — where the visual appearance is close enough to pass artwork checks, but the printed text contains discrepancies such as wrong batch numbers, misspelled brand names, altered nutritional data, missing regulatory text (e.g. FSSAI license), or fabricated serial numbers. Beyond counterfeiting, clients have no structured way to extract, store, or act on the text printed on their product packaging — leaving loyalty programs, print quality validation, batch traceability, and supply chain tracking as unserved use cases.

---

## Goals

- [ ] Extract text from product artwork images captured via the Ennteract scanning flow
- [ ] Display extracted text to users on the Ennteract dashboard in a structured, readable format
- [ ] Enable text-based validation: compare extracted text against onboarded reference text to detect discrepancies
- [ ] Support downstream use cases: loyalty code scanning, printer/artwork validation, batch verification, supply chain tracking
- [ ] Integrate Nebula OCR as a parallel signal alongside ProfX in the existing Sentinel pipeline
- [ ] Onboard new products with reference text extracted from approved artwork samples

## Non-Goals

- Not replacing ProfX or Fury — Nebula is an additive layer, not a replacement
- Not building a standalone OCR product — this is a feature within Ennteract/Sentinel
- Not building loyalty redemption infrastructure (loyalty points engine is client-side)
- Not supporting handwritten text in MVP
- Not supporting video streams in MVP

---

## Market Opportunity (TAM)

### Relevant Markets

| Segment | 2024 Size | 2030 Projection | CAGR | Relevance |
|---|---|---|---|---|
| Product Authentication | $4.5–6.2B | $9–12B | 10–12% | Direct — text extraction as auth signal |
| Connected Packaging | $8–12B | $18–24B | 15–18% | Direct — scan-to-engage via pack text |
| Track & Trace (all industries) | $18–22B | $35–48B | 12–14% | Adjacent — batch/serial capture |
| Anti-Counterfeiting Packaging | $154–174B | $240–280B | 8–10% | Broad — Ennoventure's primary market |

*Sources: MarketsandMarkets, Grand View Research, Mordor Intelligence (2023–2024)*

### Serviceable Addressable Market (SAM)

Ennoventure's SAM for Text Extraction sits at the intersection of product authentication + connected packaging + FMCG serialization: **~$3–6B, growing at 13–16% annually**.

### Competitive Whitespace

No incumbent offers OCR-from-pack-artwork as a first-class, consumer-facing, multi-use-case product:
- **Systech / Videojet / Markem-Imaje**: Do OCR on production lines with factory hardware — not accessible via mobile scan
- **Scantrust / Kezzler**: Primary auth signal is QR/CDP code; text extraction is secondary
- **Snipp Interactive**: Does receipt OCR for loyalty (closest analog) — not pack artwork

**Key insight**: Ennoventure can be the first brand protection platform to turn every piece of text on packaging into a verifiable, actionable data point — accessible from a mobile scan, without factory hardware.

### Revenue Model

| Use Case | Buyer Profile | Pricing Lever | Signal Strength |
|---|---|---|---|
| Artwork/batch text validation | FMCG brands (e.g. Ferrero) | Per-product-type onboarding fee + per-scan API fee | Strong — active prospective interest |
| Loyalty code scan (auto-populate) | Brands with loyalty programs (e.g. Denso) | Per-scan or per-redemption event fee | Strong — existing customer, adjacent ask |
| Print quality / printer validation | Packaging & print buyers | SaaS tier or per-audit fee | Medium — no current pipeline |
| Supply chain text capture | Enterprise / Pharma | Enterprise license | Later stage |

### Key Customer Signals

**Ferrero** (Prospective): Actively evaluating OCR-based text extraction from product packaging for authentication and validation. High-value FMCG prospect — millions of units globally.

**Denso** (Existing — ENL-4400): Rewards program with scratch-off labels launching in Argentina (Oct 2026). After authentication, users scratch a label to reveal a unique code and enter it manually for loyalty points. OCR can streamline this by auto-scanning the revealed code, reducing friction in the redemption flow.

---

## User Stories

| As a... | I want to... | So that... |
|---|---|---|
| Brand manager | See the extracted text from any scanned product on the Ennteract dashboard | I can verify that the correct brand name, batch, license number, and regulatory text are present |
| Ops/QA team | Compare extracted text against reference text for a product | I can detect text-based discrepancies that visual checks miss |
| Loyalty program manager | Have the scan auto-capture the printed code on the packaging | Users don't have to manually type codes to earn loyalty points |
| Product onboarding team | Extract and store reference text from an approved artwork sample | Every subsequent scan can be validated against that reference |
| Supply chain manager | Capture batch number and serial text from scanned packaging | I can trace products through the supply chain without manual data entry |

---

## Functional Requirements

### FR-1: OCR Text Extraction (Nebula Core)
- Accept a cropped artwork image (output of Fury YOLO bounding box)
- Extract all readable text using PaddleOCR (primary) with TrOCR fallback for high-accuracy requirements
- Return structured extracted text: full text block + per-field extraction where possible (brand name, batch, license number, expiry, etc.)
- Support multilingual packaging (PaddleOCR supports 80+ languages)
- Gate OCR on Fury's blur score — skip extraction on low-quality crops below threshold

### FR-2: Text Comparison Engine
- Accept extracted text + reference text (stored at onboarding)
- Compute similarity score (0–1) per field and overall
- Apply configurable threshold to flag mismatch/fake
- Methods:
  - Fuzzy string matching (Levenshtein) — detect misspellings, character substitutions
  - Normalized set overlap — detect missing or added text blocks
  - Semantic similarity (embeddings) — catch paraphrased or restructured text

### FR-3: Pipeline Integration (Sentinel)
- Nebula runs **in parallel** with ProfX on the same Fury crop — not sequentially
- Combined validation result merges artwork signal (ProfX) + text signal (Nebula) for higher confidence detection
- Deployed as a Dockerized Kubeflow pipeline stage

### FR-4: Product Onboarding — Reference Text
- Onboarding tool to extract and store reference text from approved artwork during product setup
- Stored fields per product: brand name, product name, license number (e.g. FSSAI), manufacturer details, full extracted text blob
- Configurable per-client: language, expected fields, similarity threshold

### FR-5: Ennteract Dashboard — Text Extraction View
- Display extracted text in a structured panel on the scan result screen
- Highlight matched vs. mismatched fields (green/red)
- Show confidence score per field
- Allow users to copy extracted text
- For loyalty use case: surface extracted code prominently with a one-tap copy/submit action

---

## Non-Functional Requirements

- **Latency**: Nebula must not add >500ms to end-to-end pipeline latency (runs in parallel with ProfX, not sequential)
- **Accuracy**: Character Error Rate (CER) ≤5% on clear packaging images; field-level recall ≥90% for critical fields (brand, license, batch)
- **Multilingual**: Support for minimum 10 languages at launch; 80+ via PaddleOCR model
- **Scalability**: Handle burst scan volumes consistent with existing Sentinel throughput
- **Privacy**: Extracted text stored per product/client; no cross-client data leakage
- **Security**: All extracted text transmitted over TLS; access scoped to client account

---

## Proposed Architecture

```
Raw Image  →  Fury (YOLO crop)
                    ├──  ProfX (visual classification)  ──┐
                    └──  Nebula OCR                       ├──→  Combined Result
                           ├── Stage 1: PaddleOCR          │
                           ├── Stage 2: Text Comparator    │
                           └── Stage 3: Onboarding ref  ──┘
```

### OCR Model Selection

| Model | Strengths | Trade-off | Recommendation |
|---|---|---|---|
| PaddleOCR | Lightweight, multilingual, strong on printed text | Needs paddle runtime | **Primary** |
| TrOCR | Transformer-based, state-of-the-art accuracy | Larger model, slower | Fallback for high-accuracy |
| EasyOCR | Simple API, 80+ languages | Heavier than PaddleOCR | Alternative if paddle runtime is an issue |
| Tesseract | Mature, zero-cost | Lower accuracy on complex layouts | Not recommended for MVP |

---

## Success Metrics

| Metric | Description | Target |
|---|---|---|
| Character Error Rate (CER) | Accuracy of text extraction on ground-truth artwork | ≤5% |
| Field-level recall | % of critical fields correctly extracted (brand, license, batch) | ≥90% |
| Fake detection rate | % of text-based fakes correctly flagged | ≥85% |
| False positive rate | % of genuine products incorrectly flagged | ≤3% |
| Pipeline latency added | End-to-end time added per image scan | ≤500ms |
| Loyalty redemption friction | Drop in manual code entry errors (Denso use case) | Baseline TBD at launch |

---

## Risks & Mitigations

| Risk | Mitigation |
|---|---|
| OCR errors on low-quality / blurred images | Use Fury's blur score to gate Nebula — skip OCR on low-quality crops |
| Multilingual packaging | PaddleOCR supports 80+ languages; onboard language config per product |
| Layout variation across print batches | Compare normalized text (lowercased, whitespace-stripped) rather than positional matching |
| Added pipeline latency | Lightweight model + parallel execution with ProfX, not sequential |
| Client reference text drift | Version reference text; alert clients when extracted text diverges from reference by >threshold |
| Low adoption of dashboard text view | Co-design with Ferrero and Denso for MVP UX; validate before broad rollout |

---

## Deliverables (MVP)

1. **Nebula OCR service** — Dockerized endpoint accepting a Fury-cropped image, returning extracted text
2. **Text comparator module** — Takes extracted text + reference text, returns per-field similarity scores
3. **Onboarding tool** — Script to extract and store reference text from approved artwork
4. **Kubeflow pipeline stage** — Integrates Nebula into existing Sentinel pipeline (parallel with ProfX)
5. **Ennteract dashboard view** — Structured text extraction panel on scan result screen
6. **Evaluation report** — CER, detection rates, and latency benchmarks on Cargill test set

---

## Open Questions

- [ ] What is Ferrero's expected scan volume per month? (Required for infrastructure sizing)
- [ ] For Denso loyalty flow — does OCR auto-capture replace manual entry, or is it optional alongside manual?
- [ ] What languages does Ferrero's packaging use? (Impacts model selection)
- [ ] Is there an existing Ennteract design system component for the text extraction panel, or does UX need to create one?
- [ ] What is the acceptable false positive rate for Ferrero? (Impacts threshold calibration)
- [ ] Evaluation dataset: is the Cargill test set sufficient, or do we need Ferrero/Denso sample artworks?

---

## Appendix

### Internal Research Reference
Nebula Project Writeup — `/Nebula/Nebula_Project_Writeup.docx`

### Competitive Context
- Systech (Optel): "HRT Verification" — production-line OCR, factory hardware only
- Videojet: "Print Verification" — post-print inspection, not consumer-facing
- Scantrust: "Connected Packaging" — QR/CDP primary, OCR secondary
- Snipp Interactive: "Receipt Intelligence" — receipt OCR for loyalty, not pack artwork

### Related Jira Tickets
- ENL-4400: Denso — Rewards Program with Scratch-Off Labels (existing customer, adjacent use case)
