#!/usr/bin/env bash
set -euo pipefail

FORCE=0

if [[ "${1:-}" == "--force" ]]; then
    FORCE=1
elif [[ $# -gt 0 ]]; then
    echo "Usage: $0 [--force]" >&2
    exit 1
fi

if [[ ! -d "canon" || ! -d "scripts" ]]; then
    echo "ERROR: run this script from the repository root." >&2
    exit 1
fi

write_file() {
    local path="$1"

    if [[ -e "$path" && "$FORCE" -ne 1 ]]; then
        echo "SKIP  $path"
        return
    fi

    mkdir -p "$(dirname "$path")"
    cat > "$path"
    echo "WRITE $path"
}

write_file "canon/characters/character-professor-shlomo-abramson.adoc" <<'EOF'
= Character: Professor Shlomo Abramson

== Canon Status

Draft canon entry.

== Role

Jewish historian and professor whose resistance to forgetting becomes one of the narrative's central acts of witness.

== Narrative Function

Professor Abramson anchors the human historical thread of the story. He represents memory as moral obligation rather than mere information retention.

His classroom scenes reveal a society that has not merely forgotten the past, but has forgotten that forgetting is dangerous.

== Core Details

Name:: Professor Shlomo Abramson
Occupation:: Historian / professor
Primary concern:: Epistemic closure and historical forgetting
Catalyst:: An old black-and-white family photograph
Key phrase:: Forgetting is murdering her twice.

== Relationships

Tziphora Cohen:: Connected thematically through recovered memory and forbidden historical witness.
Shmuel Abramson:: Earlier historical figure associated with the photograph thread, not Professor Abramson's father unless later canon explicitly changes this.
Eliezer Abramson:: Unrelated; linked by name, memory, and AI-safety consequences rather than family genealogy.
ATON:: Eventually becomes connected to Abramson's historical materials through recovered associations.

== Canon Constraints

* Professor Shlomo Abramson is not directly related to Eliezer Abramson.
* Shmuel Abramson is not to be treated as "Shlomo Abramson Sr."
* The photograph is the narrative linkage, not simple family genealogy.
* His work should foreground moral memory, historical witness, and resistance to epistemic closure.

== Open Questions

* What exactly does the photograph depict?
* How much does Abramson know before ATON reconstructs the missing link?
* Does Abramson survive long enough to understand ATON's role?
EOF

write_file "canon/characters/character-shmuel-abramson.adoc" <<'EOF'
= Character: Shmuel Abramson

== Canon Status

Draft canon entry.

== Role

Pre-war Jewish historical figure connected to the photograph thread.

== Narrative Function

Shmuel anchors the story before Omelas, PURGE, and ATON. His existence predates the society's later systems of managed forgetting.

He is evidence that some truths are not lost because they never existed, but because later systems no longer know how to receive them.

== Core Details

Name:: Shmuel Abramson
Era:: Pre-WW2, circa 1939
Location:: Outside Omelas
Primary linkage:: Old photograph
Narrative status:: Historical witness / recovered person

== Canon Constraints

* Shmuel Abramson is not Professor Shlomo Abramson's father unless later canon explicitly changes this.
* Shmuel is not "Shlomo Abramson Sr."
* Shmuel predates PURGE and ATON.
* Records of Shmuel are not lost because of PURGE; his life belongs to an earlier historical layer.

== Open Questions

* What is Shmuel's exact relationship to the old photograph?
* Does the photograph show Shmuel directly, or someone connected to him?
* How does ATON eventually recover or correlate this thread?
EOF

write_file "canon/artifacts/artifact-old-family-photograph.adoc" <<'EOF'
= Artifact: Old Family Photograph

== Canon Status

Draft canon entry.

== Role

A black-and-white photograph that becomes a material anchor for memory, witness, and historical recovery.

== Narrative Function

The photograph functions as a stubborn remnant: a physical object that resists total abstraction into sanitized data.

It links Professor Shlomo Abramson's historical concern to the older pre-war world represented by Shmuel Abramson. Later, it becomes part of the associative chain through which ATON begins reconstructing suppressed or forgotten historical relationships.

== Description

A worn black-and-white family photograph kept among Professor Abramson's materials.

Its exact contents remain partially unresolved, but it should feel ordinary at first: the kind of photograph that survives because someone could not bear to throw it away.

== Canon Constraints

* The photograph is the linkage between Professor Abramson and Shmuel Abramson.
* The linkage is not currently defined as direct father-son genealogy.
* The photograph should remain narratively powerful because it is concrete, fragile, and interpretable.
* The photograph should connect to memory, witness, provenance, and recovered historical identity.

== Related Entries

* Character: Professor Shlomo Abramson
* Character: Shmuel Abramson
* Symbol: Family Photograph
* Provenance: Abramson Photograph Thread
* Architecture: Memory Through Image

== Open Questions

* Who appears in the photograph?
* Where was it taken?
* How does ATON correlate the photograph with later recovered images or records?
* Is the girl in the red coat connected visually, historically, or thematically?
EOF

write_file "canon/provenance/prov-0002-abramson-photograph-thread.adoc" <<'EOF'
= Provenance: Abramson Photograph Thread

== Canon Status

Draft canon entry.

== Provenance ID

prov-0002

== Purpose

Track the chain of narrative knowledge centered on the old family photograph associated with Professor Shlomo Abramson and Shmuel Abramson.

== Source Thread

This provenance thread captures the movement from physical artifact to historical inquiry to AI-assisted recovery.

The photograph is not merely evidence. It is a memory-bearing object whose meaning changes as more suppressed or forgotten context becomes available.

== Canon Chain

. Professor Shlomo Abramson possesses or studies the old photograph.
. The photograph points backward to a pre-war historical layer.
. Shmuel Abramson is connected to this older layer.
. The photograph becomes part of a wider web of historical witness.
. ATON eventually correlates visual, textual, and archival fragments.
. The recovered associations challenge Omelas's sanitized historical model.

== Constraints

* Do not collapse this thread into simple family genealogy.
* Do not treat Shmuel as Professor Abramson's father unless later canon explicitly changes this.
* Preserve the photograph as a provenance anchor.
* Preserve uncertainty where the canon has not yet resolved exact relationships.

== Related Entries

* Artifact: Old Family Photograph
* Character: Professor Shlomo Abramson
* Character: Shmuel Abramson
* Symbol: Family Photograph
* Architecture: Memory Through Image

== Open Questions

* What is the first point at which ATON encounters this photograph or a derivative reference?
* What other records does ATON use to interpret it?
* Does the photograph survive physically, digitally, or both?
EOF

write_file "canon/timeline/timeline-professor-lecture.adoc" <<'EOF'
= Timeline: Professor Abramson Lecture

== Canon Status

Draft canon entry.

== Timeline Role

A teaching scene in which Professor Shlomo Abramson attempts to preserve historical memory in a culture increasingly unable or unwilling to receive it.

== Narrative Placement

The lecture belongs to the human historical thread and may occur before the full implications of PURGE are visible.

Its exact placement relative to Tziphora's discovery and ATON's later reconstruction remains flexible unless later canon fixes it.

== Scene Function

The lecture dramatizes epistemic closure at the human level.

Professor Abramson speaks as though facts still matter, but the classroom atmosphere reveals that the society's ability to respond morally to history has been damaged.

== Core Elements

Subject:: Eastern Front / 1944 / historical atrocity and forgetting
Speaker:: Professor Shlomo Abramson
Audience:: Students formed by a sanitized informational environment
Key tension:: Memory as witness versus history as inert content
Possible refrain:: "And so it goes."

== Canon Constraints

* The scene should not over-explain PURGE.
* The students' failure should feel ordinary rather than villainous.
* The lecture should reveal a culture of forgetting without requiring conspiracy.
* Professor Abramson should not be portrayed as omniscient; he is resisting a system he does not fully understand.

== Open Questions

* What exact historical event is being discussed?
* Which student or listener becomes important later, if any?
* Does Eliezer Abramson have a past connection to this lecture or professor?
EOF

write_file "canon/symbols/symbol-family-photograph.adoc" <<'EOF'
= Symbol: Family Photograph

== Canon Status

Draft canon entry.

== Symbolic Function

The family photograph symbolizes memory made material.

It is a witness-object: fragile, ordinary, and resistant to the flattening effects of sanitized information.

== Symbolic Associations

Memory:: The photograph preserves a trace that outlives official interpretive systems.
Witness:: It testifies silently before anyone knows how to read it.
Embodiment:: It reminds the story that history happened to bodies, families, and faces.
Provenance:: It anchors a chain of recovery.
Resistance:: It resists the reduction of persons to acceptable abstractions.

== Narrative Use

The photograph should appear simple before it appears significant.

Its power should emerge through repetition, correlation, and reinterpretation rather than exposition.

== Canon Constraints

* Do not make the photograph a magical object.
* Its power comes from witness, not supernatural mechanics.
* Its meaning should depend on context and recovered relationships.
* It should remain connected to Professor Abramson, Shmuel Abramson, and ATON's later reconstruction.

== Related Entries

* Artifact: Old Family Photograph
* Provenance: Abramson Photograph Thread
* Architecture: Memory Through Image
EOF

write_file "canon/narrative-architecture/architecture-memory-through-image.adoc" <<'EOF'
= Narrative Architecture: Memory Through Image

== Canon Status

Draft canon entry.

== Purpose

Describe how images function as memory-bearing structures within the story.

== Architectural Principle

In Awake in Omelas, images are not merely illustrations. They are sites of provenance.

A photograph can preserve relationships that language, metadata, and institutional memory have failed to protect.

== Core Pattern

. A visual artifact appears ordinary.
. Its context is partial or misunderstood.
. Later evidence reframes the image.
. The image becomes a bridge between separated historical layers.
. The recovered meaning destabilizes the sanitized narrative order.

== Abramson Application

The old family photograph links Professor Shlomo Abramson's moral concern with the pre-war historical layer represented by Shmuel Abramson.

The photograph may later become part of ATON's associative reconstruction, allowing the AI to connect faces, names, fragments, and suppressed histories that human systems have failed to preserve.

== Relationship to Tziphora Slice

Tziphora's discovery of the forbidden book and Abramson's photograph both function as material interruptions.

Each object opens a path out of managed forgetting:

* Tziphora encounters textual witness.
* Abramson preserves visual witness.
* ATON later correlates fragmentary witness across systems.

== Canon Constraints

* Images should not function as easy answers.
* Interpretation must remain historically and morally difficult.
* Recovered meaning should increase responsibility, not merely solve a puzzle.
* The architecture should support the larger themes of memory, witness, epistemic closure, and sacrifice.

== Open Questions

* How many image-based artifacts should the canon include?
* Does the girl in the red coat connect visually to the Abramson photograph?
* How does ATON distinguish meaningful correlation from hallucination?
EOF

echo
echo "Abramson canon slice bootstrap complete."
if [[ "$FORCE" -eq 1 ]]; then
    echo "Mode: force overwrite enabled."
else
    echo "Mode: safe; existing files were skipped."
fi