---
name: arzopa-skills-core
description: Installer skill for Arzopa staff core skills. Use after SkillHub installation to fetch the GitHub skill pack and install the 16 core skills into the local agent skills directory.
---

# Arzopa Skills Core Installer

This SkillHub package installs a small entry skill. Run the bundled installer script to fetch the full Arzopa core skill pack from GitHub and install the 16 core skills into your local agent skills directory.

PowerShell:

```powershell
.\scripts\install.ps1
```

Bash:

```bash
bash scripts/install.sh
```

Default source. The repository must be public or accessible to the employee's local Git credentials:

```text
https://github.com/fuyin/arzopa-skills-core.git
```
