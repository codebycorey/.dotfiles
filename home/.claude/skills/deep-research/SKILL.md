# Deep Research

Research a topic thoroughly, keeping the investigation out of the main conversation context.

**Arguments:** `<topic or question>`

## Steps

1. **Understand the question** — clarify what specifically needs to be researched.

2. **Spawn a researcher subagent** using the Task tool with `subagent_type: "researcher"` (or the Explore agent if no custom researcher is available). This keeps all intermediate search results and exploration out of the main context window.

3. **The subagent should search broadly** using web search, documentation, and codebase exploration:
   - Check official documentation first
   - Search for known issues, patterns, and best practices
   - Look at relevant source code if applicable

4. **Synthesize the subagent's findings** into a structured summary:
   - Direct answer to the question
   - Key facts and evidence
   - Trade-offs or alternatives if applicable
   - Links to sources

5. **Return the summary** to the user — concise, actionable, with enough context to make decisions.

## Guidelines

- The key value of this skill is context isolation — always use a subagent, never research inline
- Prefer authoritative sources (official docs, RFCs, source code) over blog posts
- Include links to sources for verification
- Flag uncertainty — distinguish between confirmed facts and educated guesses
- Keep the summary under 50 lines — this is a briefing, not a book report
