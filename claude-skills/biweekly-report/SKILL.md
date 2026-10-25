---
name: biweekly-report
description: Draft a biweekly work summary blog post for P2. Use this skill when the user asks to write, draft, or create their biweekly report, bi-weekly summary, or regular work update post.
allowed-tools: mcp__linear-server__get_issue, mcp__plugin_context-a8c_context-a8c__context-a8c-load-provider, mcp__plugin_context-a8c_context-a8c__context-a8c-execute-tool, Bash
---

# Biweekly Report

Draft a biweekly work summary blog post from tasks fetched from fini.

## Process

### 1. Confirm the date range

Calculate the default date range:
- **Start:** The Monday of last week (so the report covers two full calendar weeks: last week and this week). If today is Monday, "this week's Monday" is today, so start is 7 days ago; otherwise roll back to the most recent Monday first, then subtract 7 days.
- **End:** Today's date.

Run the following to compute the default start date:

```bash
python3 -c "
from datetime import date, timedelta
today = date.today()
days_since_monday = today.weekday()  # 0=Mon
this_monday = today - timedelta(days=days_since_monday)
two_weeks_ago_monday = this_monday - timedelta(weeks=1)
print(two_weeks_ago_monday.isoformat())
"
```

Present the computed start and end dates to the user and ask them to confirm or change the range before proceeding. For example:

> Using **{start_date}** to **{end_date}**. Does that look right, or would you like to use different dates?

Wait for confirmation. If the user provides different dates, use those instead.

### 2. Fetch tasks from fini

Run `fini list-between <start_date> <end_date>` to retrieve tasks completed, begun, or archived within the date range (both dates inclusive). Show the output to the user.

### 3. Fetch issue context

For each Linear issue URL or identifier in the task list, use the `mcp__linear-server__get_issue` tool to retrieve the issue title and description. Use this context to write accurate, meaningful prose — not just the raw task titles.

For tasks which have a WordPress.com P2 post link or a Slack link instead, use the context-a8c MCP: call `mcp__plugin_context-a8c_context-a8c__context-a8c-load-provider` with `wpcom` or `slack` as the provider, then `mcp__plugin_context-a8c_context-a8c__context-a8c-execute-tool` to fetch the post or thread content. Use this context to write the prose.

You can ignore tasks which have no link.

### 4. Group and write bullet points

Group related tasks into thematic bullet points. Each bullet should:

- Be written as a sentence or short paragraph in prose form (not a raw list of task names)
- Cover a coherent theme (e.g. "refund improvements", "subscription billing fixes")
- Include inline Markdown links anchored to relevant words in the prose where possible
- When there is no natural anchor text, or when there are many links, use `(this, this, and this)` style — each "this" is a separate Markdown link — placed within or at the end of the bullet

**Link format examples:**
- Natural anchor: `Fixed an issue where [refund requests were silently failing](https://linear.app/...)`
- No good anchor: `Improved the subscription cancellation flow ([this](https://linear.app/...) and [this](https://linear.app/...))`

Do not include dates. Do not list tasks individually — always group and summarize in prose.

### 5. Output

Output the bullet points inside a fenced Markdown code block so the rendering system does not parse the Markdown:

````
```
- Bullet one prose here...
- Bullet two prose here...
```
````

### 6. Copy to clipboard

After outputting, run this command to copy the raw Markdown bullet points (without the outer code fence) to the clipboard:

```bash
printf '%s' "<bullet content here>" | pbcopy
```

Confirm to the user that the content has been copied.
