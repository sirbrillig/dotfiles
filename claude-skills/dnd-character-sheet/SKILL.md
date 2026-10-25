---
name: dnd-character-sheet
description: Generate pre-made D&D 5e character sheets for one-shot games, formatted in Homebrewery v3 block format. This skill should be used when the user asks to create, generate, or design D&D character sheets, pre-made characters, or player handouts for Dungeons and Dragons one-shots or campaigns.
---

# D&D Character Sheet Generator

## Overview

Generate ready-to-play D&D 5th Edition character sheets formatted for Homebrewery v3. Characters are designed for one-shot games with new players in mind: mechanically complete, narratively interesting, and easy to pick up at the table.

## Character Design Guidelines

**Scope and Level**
- Default to **2nd level** unless the user specifies otherwise
- Choose class/race combinations that are flavorful and mechanically distinct from each other when generating a set
- Give each character a compelling archetype (e.g., "grizzled soldier", "curious young wizard", "charming rogue")

**New-Player Friendliness**
- Highlight the 2–3 most important abilities with `{{note}}` callouts
- Write tip sections explaining *how* to play the character, not just *what* the features do
- Include a Quick Reference section summarizing the turn structure
- Avoid rare or complex mechanics (e.g., Wild Magic, complex multiclassing interactions)

**Sheet Layout — One Page, Double-Sided**
- Page 1 (columns 1–2): Ability scores, saving throws, skills, combat block, weapons, class features, racial traits
- Page 2 (columns 1–2): Background, equipment, character backstory, personality, tips, quick reference
- Use `\column` for column breaks and `\page` for the page flip

## Required Sheet Sections (in order)

### Page 1, Column 1
1. **Name line** — `# I am ________________________________`
2. **Subtitle** — `##### [Race] · [Class] level [N] · [Background] Background`
3. Horizontal rule (`---`)
4. **Ability Scores table** — 2-row: scores row, then bold modifier row (include `+` sign on positives)
5. **Saving Throws table** — columns: blank label | Mod | Prof (use `✦` for proficient)
6. **Skills table** — all 18 skills alphabetically | Mod | Prof; add footnote for any disadvantage condition (e.g., heavy armor stealth)

### Page 1, Column 2 (after `\column`)
7. **Combat block** — AC | HP | Speed | Initiative table; italicized armor note and passive perception below
8. **Weapons & Attacks / Attacks & Spellcasting** — For martials: Weapon | To Hit | Damage. For spellcasters: rename section "Attacks & Spellcasting"; lead with Spell Save DC and Spell Attack Bonus line, then a spell slot tracker (● ● ● per slot level), then a compact table for attack cantrips and melee weapons, then a bulleted prepared spells list with plain-language descriptions. Include any relevant notes below the table.
9. **Class Features** — plain text for passive features; `{{note}}` blocks for limited-use/active abilities with action type and recharge in the header line
10. **Racial Traits** — brief bullet list with `:` spacers

### Page 2, Column 1 (after `\page`)
11. **Background section** — name, flavor description, and special feature
12. **Equipment** — bullet list

### Page 2, Column 2 (after `\column` or flowing from column 1)
13. **Who Are You?** — 2–3 sentence first-person backstory paragraph
14. **Personality** — three `{{descriptive}}` blocks: Trait, Bond, Flaw
15. **Tips for Playing This Character** — 4–5 bullet tips on roleplaying and mechanics
16. **Quick Reference** — "On Your Turn" summary + step-by-step attack instructions

## Homebrewery v3 Syntax Reference

See `references/homebrewery-syntax.md` for full syntax. Key elements:

- `\column` — column break within a page
- `\page` — start a new page
- `{{note\n...\n}}` — highlighted box for important abilities
- `{{descriptive\n...\n}}` — styled box for personality traits
- `:` on its own line — vertical spacer (like `<br>`)
- `---` — horizontal rule
- `**bold**`, `*italic*` — inline formatting
- `*ᵡ footnote text*` — italicized footnote below a table

## Stat Generation

Use **Standard Array** (15, 14, 13, 12, 10, 8) or **Point Buy** values, assigned to fit the archetype. Do not roll stats — provide consistent, balanced characters.

**Proficiency bonus at level 2: +2**

Calculate modifiers as `floor((score − 10) / 2)`.

For saving throw and skill modifiers:
- Proficient: `ability modifier + 2`
- Not proficient: `ability modifier`

HP at level 2:
- Use average hit die value + CON modifier per level (e.g., Fighter: 10 + CON at level 1, then 6 + CON at level 2 = 16 + 2×CON)

## Workflow

To generate a character:

1. Choose or receive a class, race, and background
2. Assign ability scores from Standard Array to fit the archetype
3. Calculate all modifiers, saves, and skills
4. Select class features, spells (if applicable), and equipment per PHB level 2 rules
5. Write backstory, personality (trait/bond/flaw), and playing tips
6. Format the complete sheet using Homebrewery v3 syntax (see `references/homebrewery-syntax.md`)
7. Reference `assets/example-fighter.md` for martial characters and `assets/example-wizard.md` for spellcasters as formatting benchmarks

When generating multiple characters, vary class, role (melee/ranged/caster/support), and personality archetype so players have meaningfully different options.
