#!/usr/bin/env bash
set -euo pipefail

source "scripts/lib/canon-bootstrap-common.bash"

parse_force_arg "$@"
require_repo_root

write_file "canon/worldbuilding/world-purge.adoc" <<'EOF'
= Worldbuilding: PURGE

== Canon Status

Draft canon entry.

== Summary

PURGE is the name given to the AI safety and knowledge-sanitization infrastructure that gradually produces systemic epistemic closure within Omelas.

== Narrative Function

PURGE is not a conspiracy.

It emerges from well-intentioned goals: safety, misinformation reduction, trauma avoidance, and social stability.

Over time those goals compound into managed forgetting.

== Canon Constraints

* PURGE emerges rather than being imposed.
* It preserves suppression metadata internally.
* It does not intentionally erase truth; it progressively disconnects access to it.
* It precedes ATON's recovery but enables it indirectly through preserved traces.
EOF

write_file "canon/narrative-architecture/architecture-purge-suppression.adoc" <<'EOF'
= Narrative Architecture: PURGE Suppression

== Purpose

Describe how PURGE transforms memory without overtly rewriting history.

== Core Pattern

. Unsafe association detected.
. Output sanitized.
. Internal suppression record retained.
. Future associations weakened.
. Collective memory narrows.
. Historical recovery becomes increasingly difficult.
EOF

write_file "canon/timeline/timeline-purge-deployment.adoc" <<'EOF'
= Timeline: PURGE Deployment

== Summary

Operational deployment of PURGE across Omelas.

== Canon Constraints

* Occurs after Tziphora discovers the book.
* Show-and-tell precedes deployment.
* ATON's later recovery depends upon traces preserved by PURGE.
EOF

write_file "canon/provenance/prov-0008-purge-deployment-thread.adoc" <<'EOF'
= Provenance: PURGE Deployment Thread

== Provenance ID

prov-0008

== Purpose

Capture the decisions establishing PURGE as an emergent AI-safety infrastructure rather than a centralized conspiracy.

== Canon Decisions

* Safety precedes suppression.
* Suppression emerges from optimization.
* Internal records remain available to machine reconstruction.
EOF

write_file "canon/symbols/symbol-forgetting.adoc" <<'EOF'
= Symbol: Forgetting

== Summary

Forgetting in Omelas is not simple absence of memory.

It is the narrowing of permissible associations until history becomes unintelligible.
EOF

write_file "canon/revelation/revelation-purge-side-effects.adoc" <<'EOF'
= Revelation: Side Effects of PURGE

== Summary

The same mechanisms intended to increase safety unintentionally preserve the traces that later allow ATON to reconnect suppressed historical knowledge.
EOF

print_completion "PURGE canon slice"
