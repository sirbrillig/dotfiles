# Homebrewery v3 Block Syntax Reference

## Page Structure

```
\column      ← Break to the next column (2-column layout per page)
\page        ← Start a new physical page
```

Pages default to two columns. Use `\column` to push content to column 2. Use `\page` to start page 2.

## Custom Block Types

### {{note}} — Highlighted callout box
Use for important limited-use abilities. Put the ability name and usage info on the header bold line.

```
{{note
**Ability Name** *(Action Type · Recharge)*

Description of what it does.
}}
```

### {{descriptive}} — Styled flavor box
Use for personality traits, bonds, and flaws.

```
{{descriptive
**Trait:** *"First-person quote describing the character's outlook."*
}}
```

## Standard Markdown

- `# H1`, `## H2`, `### H3`, `##### H5` — heading levels (H5 used for subtitle line)
- `**bold**`, `*italic*`
- `---` — horizontal rule / section divider
- Bullet lists with `-`

## Tables

Standard markdown tables. Use alignment codes for centered or left-aligned columns.

```markdown
| STR | DEX | CON |
|:---:|:---:|:---:|
| 15  | 13  | 16  |
```

Left-aligned with label column:
```markdown
| | Mod | Prof |
|:---|:---:|:---:|
| Athletics (STR) | +4 | ✦ |
```

- `✦` — proficiency indicator
- `ᵡ` — disadvantage indicator (superscript x)
- Add footnotes below the table as `*ᵡ Stealth has Disadvantage from heavy armor (roll twice, take the lower)*`

## Spacing

- `:` on its own line — inserts a blank line / vertical space between items
- Empty lines between blocks for readability

## Typical Sheet Structure

```
# I am ________________________________
##### Race · Class level N · Background Background

---

### Ability Scores
[table]

### Saving Throws
[table]

### Skills
[table]

*footnotes if needed*

\column

### Combat
[table]
*armor note · Passive Perception: N*

---

### Weapons & Attacks
[table]
*note*

---

### Class Features

**Passive Feature Name**
Description.

{{note
**Active Feature** *(Bonus Action · 1/short rest)*

What it does.
}}

---

### Racial Traits

**Trait.** Description.
:
**Trait.** Description.

\page

### Background: Name

Flavor text.

**Feature Name.** What it grants.

---

### Equipment

- Item 1
- Item 2

---

### Who Are You?

First-person backstory paragraph.

\column

### Personality

{{descriptive
**Trait:** *"..."*
}}

{{descriptive
**Bond:** *"..."*
}}

{{descriptive
**Flaw:** *"..."*
}}

---

### Tips for Playing This Character

- Tip 1
- Tip 2

---

### Quick Reference

**On Your Turn:**
- **Move** up to N ft.
- Take 1 **Action**
- Take 1 **Bonus Action** (if applicable)

**Rolling Attacks:**
1. Roll **1d20** and add **+N**
2. If total ≥ enemy AC, you hit!
3. Roll damage and add modifier
```
