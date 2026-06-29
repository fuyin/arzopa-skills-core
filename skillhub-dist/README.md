# Arzopa Skills Core SkillHub Installer

This is the SkillHub distribution package for `arzopa-skills-core`.

## Install from SkillHub

```powershell
skillhub install arzopa-skills-core --namespace arzopa --dir C:\Users\Administrator\.agents\skills --force
```

SkillHub installs this small package to:

```text
C:\Users\Administrator\.agents\skills\arzopa-skills-core
```

Then run:

```powershell
cd C:\Users\Administrator\.agents\skills\arzopa-skills-core
.\scripts\install.ps1
```

The installer fetches the full GitHub repository and copies the 16 core skill directories into the parent skills directory. The repository must be public or accessible to the employee's local Git credentials.

## Installed Skills

- `planning-with-files`
- `karpathy-guidelines`
- `find-docs`
- `exa-search`
- `smart-search`
- `agent-browser`
- `huashu-design`
- `minimax-docx`
- `minimax-pdf`
- `minimax-xlsx`
- `pptx-generator`
- `better-icons`
- `domain-modeling`
- `xquik-twitter`
- `opencli-browser`
- `opencli-browser-sitemap`

## Notes

- Existing skill directories are skipped by default.
- Use `-Overwrite` in PowerShell or `--overwrite` in Bash to copy over existing files.
- The script does not delete existing skill directories.
