# MCP Tool Configuration Per Agent

## Available MCP Servers

| MCP Server         | Connected Agent(s)              | Capability                              |
|--------------------|---------------------------------|-----------------------------------------|
| Jira (Atlassian)   | Product Owner                   | Create/update epics, stories, issues    |
| Confluence         | Product Owner, PRD Writer, GTM  | Create/update pages, spaces             |
| Linear             | Product Strategy                | Roadmap, milestones, projects           |
| Figma              | UX Designer                     | Designs, flows, prototypes, FigJam      |
| PostHog            | Analytics Agent                 | Events, funnels, queries, dashboards    |
| TLDraw             | PM Agent                        | Workflow and flow diagrams              |

---

## Per-Agent Tool Usage

### PM Agent
- **TLDraw MCP** — generate workflow diagrams when clarifying architecture or flows
  - Use `generate_diagram` for high-level flow diagrams
  - Use `create_shapes` for custom diagrams
  - Always call `diagram_drawing_read_me` before creating shapes

### Product Owner
- **Jira (via Atlassian Rovo MCP)**
  - `createJiraIssue` — create epics and stories
  - `editJiraIssue` — update existing issues
  - `searchJiraIssuesUsingJql` — check for existing epics before creating
  - `getJiraProjectIssueTypesMetadata` — confirm issue type IDs
- **Confluence (via Atlassian Rovo MCP)**
  - `createConfluencePage` — create new pages
  - `updateConfluencePage` — update existing pages
  - `getConfluenceSpaces` — find the right space

### Product Strategy
- **Linear MCP**
  - `save_project` — create/update projects
  - `save_milestone` — add milestones
  - `save_issue` — add issues to projects
  - `list_projects` — check existing roadmap

### UX Designer
- **Figma MCP**
  - `get_design_context` — read existing designs
  - `get_screenshot` — capture current state
  - `generate_diagram` — create FigJam diagrams
  - `use_figma` — general Figma operations
  - Always extract `fileKey` and `nodeId` from Figma URLs

### PRD Writer
- **Confluence (via Atlassian Rovo MCP)**
  - `createConfluencePage` — publish PRD to Confluence
  - `updateConfluencePage` — revise existing PRD page
- **GitHub (file system)**
  - Write to `docs/prds/` in markdown

### GTM Manager
- **Confluence (via Atlassian Rovo MCP)**
  - `createConfluencePage` — publish GTM plan
  - `updateConfluencePage` — update plan
- **GitHub (file system)**
  - Write to `docs/gtm/` in markdown

### Analytics Agent
- **PostHog MCP**
  - `query-trends` — analyse existing event trends
  - `query-funnel` — funnel analysis
  - `event-definitions-list` — list tracked events
  - `insight-create-from-query` — create new insights
  - `feature-flag-get-all` — check feature flags
  - Always call `switch-project` first to confirm active project

---

## Tool Call Conventions

1. **Before creating anything**, check if it already exists (search/list first)
2. **On permission errors**, report `BLOCKED: insufficient permissions for [tool]`
3. **On missing IDs** (project ID, space key, etc.), ask PM Agent to surface to human
4. **Parallel tool calls** are encouraged when independent (e.g., create Jira + Confluence simultaneously)
