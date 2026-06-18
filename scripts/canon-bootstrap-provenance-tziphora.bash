#!/usr/bin/env bash

set -euo pipefail

if ! git rev-parse --show-toplevel >/dev/null 2>&1; then
    echo "Error: must be run from within a git repository." >&2
    exit 1
fi

ROOT_DIR="$(git rev-parse --show-toplevel)"
PROVENANCE_DIR="${ROOT_DIR}/canon/provenance"

mkdir -p "${PROVENANCE_DIR}"

write_if_missing() {
    local file_path="$1"
    local content="$2"

    if [[ -f "${file_path}" ]]; then
        echo "Skipping existing provenance file: ${file_path}"
        return
    fi

    printf "%s\n" "${content}" > "${file_path}"
    echo "Created provenance file: ${file_path}"
}

write_if_missing "${PROVENANCE_DIR}/prov-0001-tziphora-opening-thread.adoc" '= Provenance: prov-0001-tziphora-opening-thread
:entry-type: PROVENANCE
:status: CANON
:created: 2026-06-18
:updated: 2026-06-18
:checkpoint: checkpoint-0001

== Decision

Establish the Tziphora opening thread as the first populated canon slice.

== Origin

This decision arose from the need to begin canon population with a small narrative thread rather than attempting to populate every canon directory at once.

== Parent Provenance IDs

None.

== Source Fragments

* Tziphora discovers the book "Night".
* Tziphora later brings the book into a show-and-tell context.
* The girl in the red coat, the selection line, and the teacher belong to the same opening thread.

== Decision Type

CANON_POPULATION_STRATEGY

== Reason Adopted

The Tziphora thread exercises multiple parts of the canon ontology while remaining narratively small and understandable.

It touches:

* character
* artifact
* timeline
* symbol
* mystery
* provenance

== Alternatives Considered

* Populate all character entries first.
* Populate all timeline entries first.
* Begin with Professor Shlomo Abramson.
* Begin with ATON-V8.
* Begin with PURGE.

== Supersedes

None.

== Superseded By

None.

== Related Entries

* character-tziphora-cohen
* artifact-book-night
* timeline-tziphora-discovers-night
* timeline-show-and-tell
* character-teacher
* symbol-red-coat
* mystery-girl-in-red-coat

== Notes

This provenance entry records the decision to follow the story thread rather than the directory tree.
'

write_if_missing "${PROVENANCE_DIR}/prov-0002-tziphora-character-entry.adoc" '= Provenance: prov-0002-tziphora-character-entry
:entry-type: PROVENANCE
:status: CANON
:created: 2026-06-18
:updated: 2026-06-18
:checkpoint: checkpoint-0001

== Decision

Populate Tziphora Cohen as the first character entry in the canon repository.

== Origin

Tziphora was selected because her discovery of the book "Night" functions as the narrative opening of the story.

== Parent Provenance IDs

* prov-0001-tziphora-opening-thread

== Source Fragments

* Tziphora is a young girl in Omelas.
* Tziphora discovers "Night" in the attic.
* Tziphora does not initially understand the full significance of what she has found.
* Tziphora later participates in a show-and-tell sequence.

== Decision Type

CHARACTER_CANONIZATION

== Reason Adopted

Tziphora provides the reader-facing entry into the mystery. Her limited understanding allows the narrative to begin with curiosity rather than explanation.

== Alternatives Considered

* Begin canon population with Professor Shlomo Abramson.
* Begin canon population with Eliezer Abramson.
* Begin canon population with ATON-V8.

== Supersedes

None.

== Superseded By

None.

== Related Entries

* character-tziphora-cohen
* artifact-book-night
* timeline-tziphora-discovers-night
* timeline-show-and-tell

== Notes

Tziphora should remain narratively important but epistemically limited at the opening.
'

write_if_missing "${PROVENANCE_DIR}/prov-0003-book-night-artifact.adoc" '= Provenance: prov-0003-book-night-artifact
:entry-type: PROVENANCE
:status: CANON
:created: 2026-06-18
:updated: 2026-06-18
:checkpoint: checkpoint-0001

== Decision

Canonize the book "Night" as the first artifact touched by Tziphora.

== Origin

The book "Night" was identified as the physical object through which Tziphora first encounters the suppressed historical mystery.

== Parent Provenance IDs

* prov-0001-tziphora-opening-thread
* prov-0002-tziphora-character-entry

== Source Fragments

* Tziphora discovers the book in the attic.
* The book is narratively significant but not fully understood by Tziphora.
* The discovery precedes the operational deployment of PURGE.

== Decision Type

ARTIFACT_CANONIZATION

== Reason Adopted

The book provides a concrete artifact linking Tziphora to memory, historical rupture, and the opening mystery.

== Alternatives Considered

* Treat the book only as a symbol.
* Treat the book only as a source fragment.
* Delay artifact canonization until broader story entries were created.

== Supersedes

None.

== Superseded By

None.

== Related Entries

* artifact-book-night
* character-tziphora-cohen
* timeline-tziphora-discovers-night
* timeline-show-and-tell

== Notes

The artifact may later also participate in symbolic and source-fragment relationships.
'

write_if_missing "${PROVENANCE_DIR}/prov-0004-tziphora-discovery-timeline.adoc" '= Provenance: prov-0004-tziphora-discovery-timeline
:entry-type: PROVENANCE
:status: CANON
:created: 2026-06-18
:updated: 2026-06-18
:checkpoint: checkpoint-0001

== Decision

Canonize Tziphora discovering "Night" as the first populated timeline entry.

== Origin

After Tziphora and the book were populated, the next logical canon element was the event connecting them.

== Parent Provenance IDs

* prov-0001-tziphora-opening-thread
* prov-0002-tziphora-character-entry
* prov-0003-book-night-artifact

== Source Fragments

* Tziphora discovers "Night" in the attic.
* The discovery is the narrative opening.
* The discovery occurs before the operational deployment of PURGE.
* The discovery precedes the show-and-tell sequence.

== Decision Type

TIMELINE_CANONIZATION

== Reason Adopted

The discovery event anchors the opening thread in sequence and distinguishes narrative placement from later chronological and operational events.

== Alternatives Considered

* Begin timeline population with PURGE deployment.
* Begin timeline population with Shmuel Abramson in 1939.
* Begin timeline population with the show-and-tell event.

== Supersedes

None.

== Superseded By

None.

== Related Entries

* timeline-tziphora-discovers-night
* character-tziphora-cohen
* artifact-book-night
* timeline-show-and-tell

== Notes

This entry should preserve the distinction between narrative opening and broader chronology.
'

write_if_missing "${PROVENANCE_DIR}/prov-0005-tziphora-discovery-checkpoint.adoc" '= Provenance: prov-0005-tziphora-discovery-checkpoint
:entry-type: PROVENANCE
:status: CANON
:created: 2026-06-18
:updated: 2026-06-18
:checkpoint: checkpoint-0001

== Decision

Create checkpoint-0001 to preserve the Tziphora discovery state before completing the remaining opening-thread entries.

== Origin

The repository had reached a coherent intermediate state: Tziphora, the book "Night", and the discovery event were populated.

== Parent Provenance IDs

* prov-0001-tziphora-opening-thread
* prov-0002-tziphora-character-entry
* prov-0003-book-night-artifact
* prov-0004-tziphora-discovery-timeline

== Source Fragments

* The first canon slice was established.
* Tziphora was populated.
* The book "Night" was populated.
* The discovery timeline entry was populated.
* The remaining Tziphora opening-thread elements were intentionally deferred.

== Decision Type

CHECKPOINT_ESTABLISHMENT

== Reason Adopted

The checkpoint allows the project to move into a fresh thread or continue later without losing the reasoning behind the first populated entries.

== Alternatives Considered

* Continue directly into show-and-tell entries without checkpointing.
* Wait to checkpoint until the entire Tziphora opening thread was complete.

== Supersedes

None.

== Superseded By

None.

== Related Entries

* checkpoint-0001
* character-tziphora-cohen
* artifact-book-night
* timeline-tziphora-discovers-night
* timeline-show-and-tell
* character-teacher
* symbol-red-coat
* mystery-girl-in-red-coat

== Notes

This provenance entry is intended to help bootstrap the next conversation thread.
'

echo
echo "Provenance bootstrap complete."