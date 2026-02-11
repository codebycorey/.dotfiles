---
description: Capture a blog-worthy insight from the current session
allowed-tools: Read, Write, Edit
argument-hint: "Category: Your insight here"
---

Capture an insight for the Claude Code blog series.

Steps:
1. Parse $ARGUMENTS for category and content. Expected format: `"Category: insight text"`
   - If no category prefix, ask the user to pick one
   - If no arguments, ask the user what they want to capture
2. Valid categories: Workflow, Agents, Context, Customization, Gotcha, Pattern
3. Read `~/blog-notes.md` if it exists to avoid duplicates and maintain format.
4. Append a new entry to `~/blog-notes.md`:

```markdown
### [Title derived from insight]
**Category**: [Category] | **Date**: [YYYY-MM-DD]

[The insight, expanded to 2-4 sentences explaining what it is and why it matters]
```

5. Confirm the entry was added and show a preview.

Rules:
- Write to `~/blog-notes.md` (user's home directory, NOT the dotfiles repo)
- Create the file with a `# Blog Notes` header if it doesn't exist
- Derive a concise title from the insight — don't just repeat it verbatim
- Expand terse insights into 2-4 useful sentences
- Don't duplicate insights already captured in the file
- Keep entries concise — this is a capture tool, not a drafting tool
