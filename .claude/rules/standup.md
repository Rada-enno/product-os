# Standup & Clarification Loop Protocol

## Standup-Style Delegation Model

```
Human PM (input)
      ↓
PM Agent [Opus — plan mode]
  1. Brainstorms input independently
  2. Classifies → generates task brief per sub-agent
  3. Shows standup brief to Human PM
  4. Kicks off sub-agents (parallel where possible)
  5. Runs status checks on each sub-agent
  6. Surfaces sub-agent questions → asks Human PM → relays answer back
      ↓
Sub-Agents [Sonnet — execute independently]
  └── Product Owner     → Jira + Confluence
  └── Product Strategy  → Linear
  └── UX Designer       → Figma
  └── PRD Writer        → docs/prds/ + Confluence
  └── GTM Manager       → docs/gtm/ + Confluence
  └── Analytics Agent   → docs/analytics/ + PostHog MCP
```

---

## PM Agent Standup Script

### 1. Pre-delegation standup brief

Before spawning any sub-agent, PM Agent outputs:

```
== STANDUP BRIEF ==
Input: [summarised input from human]
Classification: [type]

Agents:
  [Agent Name] (Primary)
  Task: [brief]
  Output: [destination]

  [Agent Name] (Supporting)
  Task: [brief]
  Output: [destination]

Parallel execution: Yes / No
Starting now. Reply STOP within 30s to hold.
==================
```

### 2. Mid-execution status check

After each major phase (e.g., Jira epic created, PRD drafted):

```
== STATUS CHECK ==
[Agent Name]: ✅ [what was completed] → [link/location]
[Agent Name]: 🔄 In progress — [current step]
[Agent Name]: ❓ BLOCKED — see clarification request below
=================
```

### 3. Closing summary

Before session ends:

```
== SESSION SUMMARY ==
Feature/Topic: [name]
Outputs:
  - PRD: docs/prds/[filename] + [Confluence link]
  - Jira Epic: [link]
  - Linear: [link]
  - Figma: [link]
  - GTM: docs/gtm/[filename] + [Confluence link]
  - Analytics: docs/analytics/[filename]
Open Items:
  - [ ] [any unresolved questions]
=====================
```

---

## Clarification Loop Protocol

### Sub-agent signals a blocker

Sub-agents MUST use this exact format when blocked:

```
BLOCKED: [clear description of what is needed]
Context: [why this is needed / what decision depends on it]
Options: [if applicable — list 2-3 options with trade-offs]
```

### PM Agent surfaces to human

```
[Agent Name] needs clarification:

> [question]

Context: [why this matters]
Options (if any):
  A) [option] — [trade-off]
  B) [option] — [trade-off]

Please reply with your answer or choice.
```

### PM Agent relays answer

After human responds, PM Agent sends to sub-agent:

```
Clarification received:
Question: [original question]
Answer: [human's response]
Please resume from where you were blocked.
```

---

## Rules for Sub-Agents

1. **Never guess** when blocked — always report `BLOCKED:`
2. **One blocker at a time** — surface the most critical blocker first
3. **Continue parallel work** while waiting — don't halt everything for one blocker
4. **Acknowledge relay** — confirm receipt: "Clarification received, resuming [task]"
5. **Status updates** — proactively report completion: "Done: [what] → [where]"

---

## Rules for PM Agent

1. **Always brainstorm first** before routing — don't immediately delegate
2. **Show standup brief** before spawning agents — human must see the plan
3. **Batch clarification questions** — if multiple agents are blocked, surface all at once
4. **Track state** — maintain a mental model of each agent's status
5. **Close the loop** — always end with a session summary
