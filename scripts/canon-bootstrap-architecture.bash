#!/usr/bin/env bash
set -euo pipefail

if [[ ! -d "canon" || ! -d "scripts" ]]; then
    echo "ERROR: run this script from the repository root." >&2
    exit 1
fi

mkdir -p docs/architecture

cat > docs/architecture/README.adoc <<'EOF'
= Architecture Notes
:toc:
:sectnums:

This directory records engineering and framework decisions for the Awake in Omelas canon system.

These notes are not canon entries and are not executable scripts. They explain why the canon framework is organized the way it is.

== Scope

Architecture notes may cover:

* canon structure
* provenance strategy
* vertical slice development
* generator scripts
* validation workflows
* visualization pipelines
* MCP authoring roadmap

== Current Notes

* xref:adr-0001-canon-generator-framework.adoc[ADR-0001: Canon Generator Framework]
EOF

cat > docs/architecture/adr-0001-canon-generator-framework.adoc <<'EOF'
= ADR-0001: Canon Generator Framework
:toc:
:sectnums:

== Status

Accepted.

== Context

The initial canon framework began with repository structure, templates, indexes, and manually populated AsciiDoc entries.

As the canon grew, repeated vertical slices emerged. Each slice tended to include characters, artifacts, provenance, timeline entries, symbols, and narrative architecture.

The MCP authoring workflow was intended to let ChatGPT write directly into the repository, but that integration is currently blocked at the ChatGPT connector creation step. In the meantime, generator scripts provide a manual but reproducible workflow.

== Decision

Canon slices will be generated through versioned bash scripts under `scripts/`.

Each generator creates a coherent first draft of a narrative slice rather than empty placeholder files.

Common generator behavior will be centralized in:

[source,text]
----
scripts/lib/canon-bootstrap-common.bash
----

Slice-specific generators will source that shared library.

== Consequences

This creates a repeatable workflow:

. Discuss narrative slice.
. Generate or update slice script.
. Run script.
. Review generated canon entries.
. Commit both the generator and generated canon files.

This preserves both the content and the process used to create it.

== Deferred Refactoring

Existing generators should be migrated to the shared library after the ATON generator is committed and verified.

Candidates:

* `scripts/canon-bootstrap-canon-entries-abramson.bash`
* `scripts/canon-bootstrap-canon-entries-tziphora.bash`

== Future Direction

The shared generator framework may later support:

* automatic provenance ID allocation
* canon validation
* cross-reference checks
* index regeneration
* graph generation
* MCP-assisted authoring
EOF

echo "Created docs/architecture architecture note scaffold."