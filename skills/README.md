# Agent Skills

This directory holds examples for use with coding agents that interact with Nu,
either as a CLI tool or via the Nushell MCP server.

## Nushell Skill

`./skills/nushell/` - An [Agent Skills](https://agentskills.io/home) compliant
skill directory built via the Claude Code skill-writer superpower and human-tested
for validity and efficacy. Once added to the appropriate location, begin a new
session with your coding agent and it should automatically register the skill
and use it when you reference Nushell, mention the skill directly, or trigger a
use case mentioned in the description of the SKILL.md frontmatter.

### Global usage

Copy the `nushell/` directory to `~/.claude/skills/` for global use in Claude Code,
to `~/.copilot/skills` for global use with the Copilot coding agent or GitHub
Copilot CLI, or to `~/.agent/skills/` for Codex, OpenCode, and other coding agents.
See your preferred LLM provider's documentation for specific details.

### Project usage

If you only wish to load this skill for specific projects, or for use with non-
CLI based coding agents that canot access a global skills directory, create a
`.claude/skills/`, `.github/skills/`, or `.agents/skills/` directory at the root
of your project and copy the nushell skill directory into it.
