---
name: pr-description
description: Draft a pull request description using the WordPress.com PR template. Use this skill whenever the user asks to write, draft, generate, or create a PR description, pull request description, or PR body — even if they just say "write up a PR for this" or "can you make a PR description". Also use it when the user asks to copy a PR description to their clipboard.
---

# PR Description

Draft a pull request description based on the current changes, using the WordPress.com PR template.

## Process

### Step 1: Check for a Linear issue

If the user hasn't provided a Linear issue URL or ID, ask: "Do you have a Linear issue to link? If not, I can create one."

- If they provide an issue ID (e.g. `SHILL-123`), construct the full URL: `https://linear.app/a8c/issue/SHILL-123/`
- If they say no issue exists, offer to create one using the Linear MCP before drafting the description. Always create it in SHILL unless the user specifies a different team.
- If they say skip it, leave the placeholder as-is

### Step 2: Draft the description

Fill in the template below based on the conversation context and changes discussed.

For **Proposed changes**: open with 1–2 sentences summarizing the change in plain English (what it does and how, at a high level), then follow with bullets for each logical change. Example opening: "This PR disables auto-renew when provisioning Woo Hosted trial plans by extending `Store_Subscription_Creator` to accept an `auto_renew` argument." Always use terms that make order of events clear like "after this PR the feature will..." rather than "now the feature will...".

For **Testing instructions**: lead with any test coverage added (include the exact command to run the relevant tests), then add a "Manual testing" section if manual verification makes sense. If there are no automated tests, you can skip the automated test section entirely. If there is no manual testing possible either, say so.

~~~
Related to <linear-url>

## Proposed changes

<1–2 sentence human-readable summary of the change>

* <bullet per logical change>

## Why are these changes being made?

<Start with a sentence or two on how the affected system works before this PR, for a reader unfamiliar with this code. Then one or two paragraphs on motivation. Focus on why this approach was chosen, not just what the code does. If fixing a bug, describe the root cause. If adding a feature, explain what problem it solves.>

## Testing instructions

Automated tests are included:

```
<test command>
```

Manual testing:
* <sandbox/environment to use>
* <steps to reproduce or verify>
* <what to confirm>
~~~

For the Linear issue link format: `https://linear.app/a8c/issue/<ISSUE-ID>/`

### Step 3: Copy to clipboard

After drafting, copy the final markdown to the clipboard using `pbcopy` (on macOS):

```bash
cat << 'EOF' | pbcopy
<the description>
EOF
```

Then confirm: "Copied to clipboard."

## Tips

- Keep "Proposed changes" bullets tight — one line each, starting with a verb
- The "Why" section is the most valuable part for future readers; don't skimp on it
- Testing instructions should be concrete enough that someone unfamiliar with the code can follow them
- If the changes are purely mechanical (e.g. a rename or format fix), the "Why" can be brief
