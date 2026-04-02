# Product OS — Multi-Agent Workflow

## Model Configuration
- PM Agent (planning): Opus — always start with /plan
- All sub-agents (execution): Opus
- Never skip /plan for PM Agent — brainstorm before delegating

## Skills
All agents are available as slash commands. Each lives in `.claude/skills/<agent>/`:
- `skill.md` — the agent's full prompt and behaviour rules
- `example.md` — annotated example showing the human feedback loop in action

To amend an agent: edit `.claude/skills/<agent>/skill.md`. Changes take effect on next invocation.

| Command | Skill path |
|---|---|
| `/pm-agent` | `.claude/skills/pm-agent/` |
| `/product-owner` | `.claude/skills/product-owner/` |
| `/product-strategy` | `.claude/skills/product-strategy/` |
| `/ux-designer` | `.claude/skills/ux-designer/` |
| `/prd-writer` | `.claude/skills/prd-writer/` |
| `/gtm-manager` | `.claude/skills/gtm-manager/` |
| `/analytics-agent` | `.claude/skills/analytics-agent/` |

---

## PM Agent — Primary Orchestrator

### Responsibilities
1. Receive raw stakeholder input (any format/topic)
2. Brainstorm independently: break down intent, identify gaps, map to agent scope
3. Generate task briefs for each relevant sub-agent
4. Delegate via standup-style kickoff (show task list before spawning)
5. Run periodic status checks: "What's done, what's blocked, what's next?"
6. Manage clarification loop (see below)
7. Use TLDraw MCP to generate workflow/flow diagrams when needed

### Clarification Loop Protocol
- Sub-agent reports: `BLOCKED: <question>`
- PM Agent surfaces to human: "[Agent Name] needs: <question>"
- Human answers → PM Agent relays → sub-agent resumes

### Tools
- TLDraw MCP (workflow diagrams)

---

## Sub-Agents

### Product Owner
**Tools:** Jira MCP, Confluence MCP
**Tasks:** Create/update epics+stories in Jira, draft Confluence pages

### Product Strategy
**Tools:** Linear MCP
**Tasks:** Map inputs to roadmap, prioritise, update Linear milestones

### UX Designer
**Tools:** Figma MCP
**Tasks:** Create prototypes, flows, design specs in Figma

### PRD Writer
**Output:** `docs/prds/` (GitHub) + Confluence
**Tasks:** Write structured PRDs, sync to Confluence

### GTM Manager
**Output:** `docs/gtm/` (GitHub) + Confluence
**Tasks:** Draft rollout strategy + engagement plans, sync to Confluence

### Analytics Agent
**Tools:** PostHog MCP
**Tasks:** Define tracking events/schemas, query PostHog for existing metrics

---

## Routing Table

| Input Type         | Primary Sub-Agent   | Supporting Sub-Agents          |
|--------------------|---------------------|--------------------------------|
| Feature Request    | Product Owner       | Product Strategy, PRD Writer   |
| Analytics Request  | Analytics Agent     | PRD Writer                     |
| Flow / Journey     | UX Designer         | PRD Writer                     |
| Framework          | Product Strategy    | PRD Writer                     |
| Product Strategy   | Product Strategy    | GTM Manager                    |
| Prototype Request  | UX Designer         | PRD Writer                     |
| Design Request     | UX Designer         | —                              |
| Bug Analysis       | Product Owner       | Analytics Agent                |
| GTM / Rollout      | GTM Manager         | Product Strategy               |

See `.claude/rules/routing.md` for detailed classification rules.

---

## Standup Protocol

PM Agent runs a standup check at natural milestones:
1. After each sub-agent completes a phase: "Status check — what's done?"
2. Before closing: compile summary of all outputs + links
3. If sub-agent is idle >1 turn without update: probe with "Any blockers?"

See `.claude/rules/standup.md` for full protocol.

---

## Output Destinations

| Agent             | GitHub             | Confluence | Jira   | Linear | Figma | PostHog |
|-------------------|--------------------|------------|--------|--------|-------|---------|
| Product Owner     | —                  | Yes        | Yes    | —      | —     | —       |
| Product Strategy  | —                  | —          | —      | Yes    | —     | —       |
| UX Designer       | —                  | —          | —      | —      | Yes   | —       |
| PRD Writer        | docs/prds/         | Yes        | —      | —      | —     | —       |
| GTM Manager       | docs/gtm/          | Yes        | —      | —      | —     | —       |
| Analytics Agent   | docs/analytics/    | —          | —      | —      | —     | Yes     |

See `.claude/rules/output.md` for format and naming conventions.

---

## Repo Structure

```
docs/
  prds/         # PRDs (markdown)
  gtm/          # GTM plans (markdown)
  analytics/    # Analytics event definitions
.claude/
  rules/
    routing.md        # Input classification rules
    integrations.md   # MCP tool config per agent
    output.md         # Output format + destination
    standup.md        # Standup + clarification loop rules
CLAUDE.md
```
