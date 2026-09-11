## Stage 1: Snapshot Current Configs
**Goal**: Capture the live Ghostty, tmux, Starship, and zsh settings.
**Success Criteria**: Repo contains copies of the active config files.
**Tests**: Compare tracked files against source paths.
**Status**: Complete

## Stage 2: Add Repo Tooling
**Goal**: Make the repo easy to restore from on this machine.
**Success Criteria**: Install script backs up existing files and creates symlinks.
**Tests**: Run script help/dry-run style checks where practical.
**Status**: Complete

## Stage 3: Document Usage
**Goal**: Record what is tracked and how to apply it.
**Success Criteria**: README explains layout, install flow, and tracked paths.
**Tests**: Review commands for correctness.
**Status**: Complete

## Stage 4: Inventory Publication Scope
**Goal**: Identify local and remote history and other GitHub content exposed by publication.
**Success Criteria**: Branches, tags, tracked files, and repository visibility are checked.
**Tests**: Compare local refs with remote refs; inspect GitHub repository metadata.
**Status**: Complete

## Stage 5: Review Files and History
**Goal**: Check every historical file version and commit metadata for secrets and private information.
**Success Criteria**: Automated secret scanning and manual content review are complete.
**Tests**: Scan all refs and historical blobs; review identities, paths, and removed content.
**Status**: Complete

## Stage 6: Record Publication Assessment
**Goal**: Document findings, coverage, and any remaining publication concerns.
**Success Criteria**: A review report distinguishes credentials from intentional personal disclosures.
**Tests**: Verify report against scan results and source references.
**Status**: Complete
