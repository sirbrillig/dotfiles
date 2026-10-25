---
name: fini
description: Interact with the fini CLI task manager. Use this skill when the user wants to add, list, star, begin, check, or filter tasks in fini. Trigger phrases include "add to fini", "fini add", "fini list", "fini star", "fini begin", "fini check", "list my tasks", "mark as done", "mark as in progress", or when the user shares a Linear URL and asks to track it.
allowed-tools: Bash, WebFetch
---

# fini

Interact with the fini CLI task manager. Supports adding, listing, starring, beginning, checking, and date-filtered listing of tasks.

## Command Reference

```
fini add [TITLE]... [--link <URL>]   # Add a new task
fini list                             # List all current tasks
fini star <INDEX>...                  # Toggle star on one or more tasks
fini begin <INDEX>...                 # Toggle in-progress on one or more tasks
fini check <INDEX>...                 # Toggle done on one or more tasks
fini list-after-date <DATE>           # List completed/begun/archived tasks since date
```

- Indices are 1-based and refer to the visible position in `fini list` output.
- `begin`, `star`, and `check` accept multiple indices (e.g. `fini begin 1 3`).
- Dates for `list-after-date` use `YYYY-MM-DD` format.

## Workflows

### fini list

Run `fini list` and show the output to the user. Use this whenever the user asks to see their tasks, or before performing index-based operations if the user hasn't specified an index.

### fini star / fini begin / fini check

1. If the user hasn't specified which task(s), run `fini list` first so they can choose.
2. Run the command with the provided index or indices.
3. Show the output.

These commands toggle: running them again on the same task reverses the action.

### fini add

#### When a Linear URL is provided

1. Use `WebFetch` on the Linear URL with this prompt: "Return only the issue title (not the issue ID/number, just the plain text title of the issue)."
2. Use the fetched title as the task title.
3. Run: `fini add <title> --link <url>`
4. Show the command output.

**Linear URL format:** `https://linear.app/<workspace>/issue/<ID>/<slug>`

The slug at the end is a kebab-case hint, but always prefer the actual fetched title. If WebFetch fails or returns a loading screen (Linear is a React SPA and may not render server-side), fall back to converting the URL slug to title case: split on `-`, capitalize each word, join with spaces.

#### When a non-Linear URL is provided

1. If the user provided an explicit title, use it directly.
2. If no title is given, optionally use `WebFetch` to get the page title, or ask the user.
3. Run: `fini add <title> --link <url>`

#### When no URL is provided

Run: `fini add <title>`

Use the title exactly as the user provided it. Do not paraphrase or reformat unless asked.

### fini list-after-date

Run `fini list-after-date <DATE>` and show the output. If the user says something like "since last Monday" or "after the 15th", convert it to `YYYY-MM-DD` format using today's date as reference before running the command.

## Notes

- Always show command output after running any fini command.
- If the user asks to add multiple tasks, add them one at a time in sequence.
- Do not run `fini list` unless needed (user asked, or index is unknown for an operation).
