# Product OS — Skills Reference

All agents are invocable as slash commands. Each skill includes a **human feedback loop** with explicit review checkpoints before any external action (Jira, Confluence, Linear, Figma, PostHog).

---

## Available Skills

| Slash Command | Agent | Model | Primary Tools | Feedback Checkpoints |
|---|---|---|---|---|
| `/pm-agent` | PM Agent | Opus | TLDraw | Standup brief → approval → status checks → session summary |
| `/product-owner` | Product Owner | Opus | Jira, Confluence | Draft review → approval → creation → output review |
| `/product-strategy` | Product Strategy | Opus | Linear | Project draft → approval → creation → roadmap review |
| `/ux-designer` | UX Designer | Opus | Figma | Design brief → approval → creation → output review |
| `/prd-writer` | PRD Writer | Opus | File system, Confluence | TAM review → PRD draft review → PUBLISH approval |
| `/gtm-manager` | GTM Manager | Opus | File system, Confluence | Strategy outline → draft review → PUBLISH approval |
| `/analytics-agent` | Analytics Agent | Opus | PostHog | Event schema draft → approval → creation → output review |

---

## Human Feedback Loop — How It Works

Every agent follows a **3-gate** pattern:

```
Gate 1 — PLAN
  Agent presents what it intends to do (draft, outline, brief)
  Human reviews and approves or requests changes
        ↓
Gate 2 — EXECUTE
  Agent takes action only after Gate 1 approval
  External systems are only touched after approval
        ↓
Gate 3 — REVIEW
  Agent presents what was created (links, file paths)
  Human confirms outputs are correct
```

### Gate Keywords

| Keyword | Meaning |
|---|---|
| `GO` or `PUBLISH` | Proceed to next gate |
| `STOP` | Halt — do not proceed |
| `BLOCKED:` | Agent hit a gap — surfaces to human for resolution |
| *(reply with edits)* | Agent incorporates feedback and re-presents |

---

## Skill File Locations

```
.claude/commands/
  pm-agent.md           → /pm-agent
  product-owner.md      → /product-owner
  product-strategy.md   → /product-strategy
  ux-designer.md        → /ux-designer
  prd-writer.md         → /prd-writer
  gtm-manager.md        → /gtm-manager
  analytics-agent.md    → /analytics-agent
```

---

## Amending a Skill

To update an agent's behaviour:
1. Edit the relevant `.claude/commands/<agent>.md` file
2. Changes take effect on the next invocation of that skill
3. Update this `skills.md` table if the feedback checkpoints or tools change

---

## Routing — When to Use Which Skill

| Input Type | Primary Skill | Supporting Skills |
|---|---|---|
| Feature Request | `/product-owner` | `/product-strategy`, `/prd-writer` |
| Analytics Request | `/analytics-agent` | `/prd-writer` |
| Flow / Journey | `/ux-designer` | `/prd-writer` |
| Framework / Scoring | `/product-strategy` | `/prd-writer` |
| Product Strategy | `/product-strategy` | `/gtm-manager` |
| Prototype / Wireframe | `/ux-designer` | `/prd-writer` |
| GTM / Rollout | `/gtm-manager` | `/product-strategy` |
| Multi-domain / Complex | `/pm-agent` | *(orchestrates all others)* |

---

## Model Configuration

All agents use **Opus** model for maximum reasoning quality.

| Context | Model |
|---|---|
| PM Agent (planning + orchestration) | Opus |
| Product Owner | Opus |
| Product Strategy | Opus |
| UX Designer | Opus |
| PRD Writer | Opus |
| GTM Manager | Opus |
| Analytics Agent | Opus |
