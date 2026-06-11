---
name: pnpm-security
description: Protect the repo against supply chain attacks through specific pnpm configuration
---

To make this repo compliant with our pnpm add and validate the following changes:

## package.json — add/merge:

pnpm >= v10 is required to use the new features and policies. The preinstall script ensures that contributors use pnpm to install dependencies, preventing issues with incompatible package managers.

```
"engines": {
  "pnpm": ">=10"
},
"scripts": {
  "preinstall": "npx only-allow pnpm"
}
```

Also run pnpm add -D only-allow (needed for the preinstall script).

## pnpm-workspace.yaml — add/merge at root level:

```
packages:
  - .
minimumReleaseAge: 10080
trustPolicy: no-downgrade
```

Create the file if it doesn't exist. The `packages` field is required — without it, pnpm errors with "packages field missing or empty" on commands like `pnpm update`. For a non-workspace repo, list `.` as the sole package; for an actual workspace, list the real member globs instead.

## Notes

- If the repo uses npm, do not attempt to convert it to pnpm. STOP and inform the user this step is needed first.
- Do not set dangerouslyAllowAllBuilds: true — ever.
- If any package needs a post-install script, add it to onlyBuiltDependencies in pnpm-workspace.yaml — do not use neverBuiltDependencies without also setting onlyBuiltDependencies.
