# Input Classification & Routing Rules

## How to Classify Incoming Input

The PM Agent MUST classify every stakeholder input before delegating. Follow this decision tree:

### Step 1 — Identify the primary intent

| Keyword / Signal                                      | Classification        |
|-------------------------------------------------------|-----------------------|
| "build", "add", "implement", "create [feature]"       | Feature Request       |
| "track", "measure", "analytics", "metrics", "funnel"  | Analytics Request     |
| "flow", "journey", "user path", "steps", "process"    | Flow / Journey        |
| "framework", "model", "scoring", "matrix"             | Framework             |
| "strategy", "roadmap", "vision", "prioritise"         | Product Strategy      |
| "prototype", "mockup", "wireframe", "demo"            | Prototype Request     |
| "design", "UI", "visual", "branding"                  | Design Request        |
| "bug", "issue", "broken", "regression", "error"       | Bug Analysis          |
| "launch", "rollout", "GTM", "go-to-market", "release" | GTM / Rollout         |

### Step 2 — Route to agents

Use the routing table in `CLAUDE.md`. When input spans multiple categories:
- Assign **one primary agent** (owns the deliverable)
- Assign **supporting agents** (contribute components)
- Primary agent owns the final synthesis

### Step 3 — Generate a task brief per agent

Each brief MUST include:
```
Agent: [Agent Name]
Role: Primary | Supporting
Task: [1-2 sentence description of what to do]
Inputs: [what the agent needs — context, data, prior outputs]
Output: [expected deliverable + destination]
Blockers: [known gaps — agent should report BLOCKED if hit]
```

### Step 4 — Show standup brief to human PM before spawning

Before kicking off sub-agents, display:
```
Standup Brief — [Input Summary]
---
Agents involved: [list]
[Task brief per agent]
---
Proceeding in [X mins]. Reply STOP to hold.
```

## Edge Cases

- **Ambiguous input**: PM Agent asks ONE clarifying question before classifying
- **Multi-domain input**: Split into separate task briefs; co-ordinate via PM Agent
- **Repeat input**: Check if prior PRD/epic exists; link rather than duplicate
