# Copilot Instructions for 8-ForEach ✅

## Purpose
This repository contains a single PowerShell utility (`foreach.ps1`) that creates or deletes folders under `Data\Share` based on newline-delimited lists. These notes capture repository-specific conventions, safe edit patterns, and developer workflows to help an AI agent be productive quickly.

## Quick overview
- Entrypoint: `foreach.ps1` (PowerShell script)
- Data files: `Data/Share/FolderNames.txt`, `Data/Departments.txt` (plain text, one folder name per line)
- Platform: Windows PowerShell

## Key behaviors to preserve 🔧
- CLI parameters: `-Source` (FolderNames|Departments|Custom), `-Action` (Create|Delete), `-CustomPath`, and `-DryRun`.
- The script uses `[CmdletBinding(SupportsShouldProcess=$true)]` and `$PSCmdlet.ShouldProcess(...)` — **keep** this pattern when changing side-effecting logic so `-WhatIf`/`-Confirm` continue to work as expected.
- Sanitization: folder names are cleaned using the regex `[<>:\"/\\|?*]` and trimmed. Invalid/empty names are skipped with `Write-Warning`.
- Idempotency: `New-Item -Force` is used for creation; avoid introducing non-idempotent behaviors.
- Summary & exit: the script reports counters (created, deleted, skipped, already existed) and uses `Write-Error` + `exit 1` for fatal errors (e.g., missing custom path).

## Useful commands / testing tips 🧪
- Dry run (safe, no filesystem changes):
  - `.oreach.ps1 -Source FolderNames -Action Create -DryRun`
- Use PowerShell's `-WhatIf` / `-Confirm` thanks to `SupportsShouldProcess`:
  - `.oreach.ps1 -Source FolderNames -Action Delete -WhatIf`
- To test a custom list:
  - `.oreach.ps1 -Source Custom -CustomPath 'C:\path\to\list.txt' -Action Create -DryRun`
- Run from repo root (or from `c:\Scripts\8-ForEach`) so `$MyInvocation.MyCommand.Definition` resolves `Data\...` paths correctly.

## When modifying the script ✏️
- If you add a new `Source` option, update **both** the `ValidateSet('FolderNames','Departments','Custom')` and the `switch ($Source)` block that sets `$sourceFile`.
- Preserve: parameter validation attributes, `SupportsShouldProcess`, sanitization regex, and final summary/counters.
- Use `Write-Host`, `Write-Warning`, `Write-Error` consistently (no silent failures) to keep behavior predictable.
- For destructive changes, ensure `-DryRun` and `-WhatIf` reflect what would happen and that counters are accurate.

## PR review checklist ✅
- Does the change keep `SupportsShouldProcess` semantics for all mutating operations?
- Are parameter validations updated for any new flags or allowed values?
- Are new data files under `Data/` plain text, one folder per line? Duplicates and blanks should be handled (current pattern: `Trim()` + `Where-Object { $_ -ne '' } | Select-Object -Unique`).
- Do tests (or manual commands) verify `-DryRun`, `-WhatIf`, and actual create/delete flows?
- Did you preserve the sanitization regex to avoid invalid filesystem names?

## Where to look for examples
- `foreach.ps1`: canonical examples of parameter usage, path resolution, sanitization, counters, and messaging.
- `Data/Share/FolderNames.txt` and `Data/Departments.txt`: canonical input format.

> Note: This repo currently has no CI or automated tests. If adding tests, place Pester specs under `Tests/` and ensure they run on Windows. Prefer running the script with `-DryRun` inside tests unless the test environment can safely create/delete test folders.

---

If you'd like, I can open a PR with this file added, or iterate on the content to include anything else you want emphasized. 🔁