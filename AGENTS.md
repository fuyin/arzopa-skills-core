# Arzopa Skills Core Agent Rules

Always respond in Chinese when working inside this repository.

## Positioning

This repository is the core skill pack for Arzopa staff workflows. Arzopa is a portable smart display brand focused on portable monitors, digital photo frames, and smart display solutions.

## Default Skills

- Use `planning-with-files` for complex tasks, research, publishing work, or anything that may take 5+ tool calls.
- Use `karpathy-guidelines` when writing, reviewing, or changing code and workflow artifacts.
- Use current docs/source before relying on memory for tools, APIs, public product facts, prices, inventory, warranty, logistics, or platform rules.

## Arzopa Fact Rules

- Internal material outranks public sources.
- Public source priority: official policy/product pages, official LinkedIn, ecommerce platforms, news/reviews, third-party databases.
- Prices, discounts, stock, Prime Day activity, warranty years, employee count, and founding year are unstable; verify them at task time.
- Label claims as verified fact, official statement, third-party source, or needs internal verification.

## Editing Rules

- Keep the core pack small and staff-oriented.
- Do not add narrow engineering-only skills to core unless they support broad Arzopa workflows.
- Do not commit secrets, cookies, tokens, private customer data, or local machine state.
- Avoid destructive filesystem operations. Do not batch-delete files with scripts.
