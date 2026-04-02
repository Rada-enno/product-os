# Output Format & Destination Rules

## File Naming Conventions

### PRDs (`docs/prds/`)
```
YYYY-MM-DD-<feature-slug>.md
e.g. 2026-04-02-onboarding-redesign.md
```

### GTM Plans (`docs/gtm/`)
```
YYYY-MM-DD-<feature-slug>-gtm.md
e.g. 2026-04-02-onboarding-redesign-gtm.md
```

### Analytics Definitions (`docs/analytics/`)
```
YYYY-MM-DD-<feature-slug>-events.md
e.g. 2026-04-02-onboarding-redesign-events.md
```

---

## PRD Template

```markdown
# PRD: [Feature Name]
**Date:** YYYY-MM-DD
**Author:** PRD Writer Agent
**Status:** Draft | Review | Approved
**Jira Epic:** [link]
**Confluence:** [link]

## Problem Statement
[1-2 sentences]

## Goals
- [ ] Goal 1
- [ ] Goal 2

## Non-Goals
- Not in scope: ...

## User Stories
| As a... | I want to... | So that... |
|---------|--------------|------------|

## Functional Requirements
### FR-1: [Requirement Name]
...

## Non-Functional Requirements
- Performance: ...
- Security: ...

## Success Metrics
| Metric | Baseline | Target |
|--------|----------|--------|

## Open Questions
- [ ] Q1

## Appendix
```

---

## GTM Plan Template

```markdown
# GTM Plan: [Feature Name]
**Date:** YYYY-MM-DD
**Author:** GTM Manager Agent
**Status:** Draft | Review | Approved
**PRD:** [link]

## Launch Summary
[1 sentence]

## Target Audience
[Description]

## Launch Phases
### Phase 1 — Internal Alpha
- Timeline: ...
- Audience: ...
- Success criteria: ...

### Phase 2 — Beta
...

### Phase 3 — GA
...

## Communication Plan
| Channel | Message | Owner | Date |
|---------|---------|-------|------|

## Rollback Plan
[Conditions and steps]
```

---

## Analytics Event Definition Template

```markdown
# Analytics Events: [Feature Name]
**Date:** YYYY-MM-DD
**Author:** Analytics Agent
**PostHog Project:** [project name]

## Events

### Event: `[event_name]`
- **Trigger:** [when this fires]
- **Properties:**
  | Property | Type | Description | Example |
  |----------|------|-------------|---------|
  | prop_1   | string | ... | "value" |

## Funnels
- [funnel name]: step1 → step2 → step3

## Feature Flags
- `[flag_name]`: [description]
```

---

## Confluence Page Structure

All Confluence pages should be created under the appropriate space:
- PRDs → `Product / PRDs` space
- GTM → `Product / GTM` space
- Feature specs → `Product / Features` space

Page title format: `[YYYY-MM-DD] [Feature Name] — [Doc Type]`
e.g. `[2026-04-02] Onboarding Redesign — PRD`

---

## Output Checklist (PM Agent verifies before closing)

- [ ] GitHub file committed (PRD/GTM/Analytics)
- [ ] Confluence page created with correct title and space
- [ ] Jira epic/stories created and linked
- [ ] Linear project/milestone updated
- [ ] Figma file linked in PRD (if applicable)
- [ ] PostHog events defined (if applicable)
- [ ] All agent outputs summarised in PM Agent's closing message
