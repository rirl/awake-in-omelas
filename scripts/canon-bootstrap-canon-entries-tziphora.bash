#!/usr/bin/env bash
set -euo pipefail

source "scripts/lib/canon-bootstrap-common.bash"

parse_force_arg "$@"
require_repo_root

write_file "canon/characters/character-tziphora-cohen.adoc" <<'EOF'
= Character: Tziphora Cohen
:entry-type: CHARACTER
:status: CANON
:created: 2026-06-18
:checkpoint: checkpoint-initial-canon-2026-06-25
:provenance-id: prov-0001-tziphora-opening-thread

== Summary

Young girl whose discovery of the book "Night" initiates the narrative opening of the story.

== Canonical Facts

* Tziphora lives in Omelas.
* She discovers a copy of "Night" in the attic.
* The discovery precedes the operational deployment of PURGE.
* She later presents the book during a show-and-tell exercise.
* She does not initially understand the historical or moral significance of the book.

== Narrative Function

Tziphora is the reader-facing opening witness.

Her curiosity creates the first rupture in Omelas's managed forgetting. She does not begin as a rebel, historian, or theorist. She begins as a child who finds something that should not have survived.

== Relationships

Teacher:: Adult representative of the sanctioned interpretive order.
Book "Night":: Physical artifact that initiates Tziphora's discovery thread.
Girl in Red Coat:: Indirect mystery connection through image, memory, and recognition.
ATON:: Later machine witness whose recovered associations may reconnect Tziphora's discovery to broader historical truth.
Professor Shlomo Abramson:: Thematic counterpart through historical witness and resistance to forgetting.

== Timeline Notes

Tziphora's discovery of the book serves as the narrative opening.

The later show-and-tell sequence occurs before the operational deployment of PURGE.

The exact chronological relationship between Tziphora's thread, Abramson's lecture, and ATON's awakening remains flexible unless later canon fixes it.

== Knowledge State

Tziphora knows that the book feels strange and important.

She does not yet know why the book matters, why it was hidden, or why the images and names inside it disturb the sanctioned story of Omelas.

== Canon Constraints

* Tziphora should remain epistemically limited at the opening.
* Her discovery should invite mystery rather than explain the world.
* She should not be treated as an adult ideological dissident.
* The emotional force of her thread should come from innocence encountering suppressed witness.

== Open Questions

* Who placed the book in the attic?
* Why did the book survive?
* What image or phrase first unsettles Tziphora?
* How does the show-and-tell scene change her understanding?
EOF

write_file "canon/artifacts/artifact-book-night.adoc" <<'EOF'
= Artifact: Book "Night"
:entry-type: ARTIFACT
:status: CANON
:created: 2026-06-18
:checkpoint: checkpoint-initial-canon-2026-06-25
:provenance-id: prov-0001-tziphora-opening-thread

== Summary

A physical copy of "Night" discovered by Tziphora in the attic.

== Description

The book is old and unexpected.

Tziphora does not initially understand its significance, but the discovery becomes the narrative opening of the story.

The book is a material interruption: a piece of historical witness that should have been impossible within the sanctioned informational world of Omelas.

== Artifact Type

Book.

== Location

Attic storage.

== Narrative Function

The book introduces textual witness.

Where Abramson's photograph preserves visual witness and ATON later reconstructs machine witness, the book gives Tziphora an embodied encounter with forbidden memory.

== Related Entries

* Character: Tziphora Cohen
* Character: Teacher
* Timeline: Tziphora Discovers Night
* Timeline: Show and Tell
* Mystery: Girl in Red Coat
* Symbol: Red Coat

== Canon Constraints

* The narrative may refer to the book as "Night".
* The book should remain a real historical artifact, not a symbolic invention.
* Tziphora's discovery occurs before the operational deployment of PURGE.
* The discovery should raise questions before it answers them.

== Provenance

See prov-0001-tziphora-opening-thread.

== Open Questions

* How did the book survive Omelas's sanitizing systems?
* Was it intentionally hidden, forgotten, or preserved by accident?
* What specific page or image becomes narratively important?
EOF

write_file "canon/timeline/timeline-tziphora-discovers-night.adoc" <<'EOF'
= Timeline Entry: Tziphora Discovers Night
:entry-type: TIMELINE
:status: CANON
:created: 2026-06-18
:checkpoint: checkpoint-initial-canon-2026-06-25
:provenance-id: prov-0001-tziphora-opening-thread

== Summary

Tziphora discovers a copy of "Night" in the attic.

== Event

While exploring the attic, Tziphora finds an old copy of "Night".

The discovery becomes the narrative opening of the story.

== Timeframe

Before the operational deployment of PURGE.

== Sequence Relationship

Before:: Show and Tell.
After:: Unspecified.
Concurrent With:: Not fixed.

== Characters Present

* Tziphora Cohen

== Narrative Placement

Narrative opening.

== Chronological Placement

Occurs before PURGE deployment.

The exact relation to Professor Abramson's lecture and ATON's later awakening remains intentionally flexible unless later canon fixes it.

== Narrative Function

This event establishes the first rupture in Omelas's managed forgetting.

A child encounters historical witness before any adult explanation, institutional correction, or system-level suppression can frame it for her.

== Related Entries

* Character: Tziphora Cohen
* Artifact: Book "Night"
* Timeline: Show and Tell
* Mystery: Girl in Red Coat

== Canon Constraints

* This scene should function as invitation, not exposition.
* Tziphora should not yet understand the book's significance.
* The discovery should preserve the sense of something ordinary becoming dangerous.

== Provenance

See prov-0001-tziphora-opening-thread.
EOF

write_file "canon/characters/character-teacher.adoc" <<'EOF'
= Character: Teacher
:entry-type: CHARACTER
:status: CANON
:created: 2026-06-18
:checkpoint: checkpoint-initial-canon-2026-06-25
:provenance-id: prov-0001-tziphora-opening-thread

== Summary

Unnamed teacher who receives Tziphora's show-and-tell presentation and voices the sanctioned interpretive order of Omelas.

== Canonical Content

The Teacher is not a villainous conspirator.

The Teacher represents a person formed by the culture of forgetting: someone who enforces the official frame because it seems normal, safe, and responsible.

== Narrative Purpose

The Teacher reveals that Omelas's historical suppression does not require obvious malice.

The danger is ordinary. The adult world has learned what not to notice, what not to ask, and how to redirect children away from destabilizing witness.

== Character Arc

The Teacher's arc may remain minimal.

Their primary function is diagnostic: the Teacher shows the reader how Omelas interprets dangerous memory when it appears in public.

== Relationships

Tziphora Cohen:: Student whose discovery unsettles the classroom order.
Book "Night":: Object the Teacher must interpret or contain.
Girl in Red Coat:: Indirectly connected through Tziphora's disturbed attention.
PURGE:: The Teacher's behavior anticipates or reflects the social conditions that PURGE later systematizes.

== Knowledge State

The Teacher may not understand the full significance of what Tziphora has brought.

The Teacher knows how the subject is supposed to be handled, redirected, minimized, or corrected.

== Canon Constraints

* The Teacher should remain unnamed unless later canon requires a name.
* The Teacher should not be made into the hidden architect of suppression.
* The Teacher should represent ordinary compliance, not secret conspiracy.
* The scene should preserve ambiguity between concern, discomfort, and indoctrinated correction.

== Open Questions

* Does the Teacher recognize the book?
* Does the Teacher report the incident?
* Does the Teacher feel fear, confusion, irritation, or pity?
* Is the Teacher later remembered by Tziphora?
EOF

write_file "canon/timeline/timeline-show-and-tell.adoc" <<'EOF'
= Timeline Entry: Show and Tell
:entry-type: TIMELINE
:status: CANON
:created: 2026-06-18
:checkpoint: checkpoint-initial-canon-2026-06-25
:provenance-id: prov-0001-tziphora-opening-thread

== Summary

Tziphora brings the discovered book to class and presents it during show and tell.

== Event

Tziphora presents the book "Night" in a classroom setting.

The Teacher responds from within the sanctioned interpretive order, revealing the social mechanisms of managed forgetting.

== Relative Ordering

Before:: Operational deployment of PURGE.
After:: Tziphora discovers "Night" in the attic.
Concurrent With:: Not fixed.

== Participants

* Tziphora Cohen
* Teacher
* Students

== Narrative Purpose

The show-and-tell scene moves the forbidden artifact from private discovery into public interpretation.

The classroom becomes the first social test of whether Omelas can receive the witness the book carries.

== Associated Mysteries

* Mystery: Girl in Red Coat
* Why did the book survive?
* Why does the official interpretive order fail to account for it?

== Associated Artifacts

* Artifact: Book "Night"

== Canon Constraints

* The scene occurs before PURGE deployment.
* The Teacher should not fully understand or fully explain the danger.
* The event should feel ordinary on the surface.
* The scene should expose social forgetting before technical suppression.

== Provenance

See prov-0001-tziphora-opening-thread.

== Open Questions

* What exactly does Tziphora say during the presentation?
* How do the other children respond?
* Does the Teacher confiscate the book?
* Is this incident later recoverable by ATON?
EOF

write_file "canon/symbols/symbol-red-coat.adoc" <<'EOF'
= Symbol: Red Coat
:entry-type: SYMBOL
:status: CANON
:created: 2026-06-18
:checkpoint: checkpoint-initial-canon-2026-06-25
:provenance-id: prov-0001-tziphora-opening-thread

== Summary

The red coat is a visual marker of personhood, witness, and historical specificity.

== Literal Form

A red coat associated with the girl in the red coat mystery.

The exact visual presentation remains flexible: the coat may be worn, carried, remembered, or visually echoed through recovered images.

== Symbolic Function

The red coat resists abstraction.

It marks a person who might otherwise be reduced to category, statistic, sanitized reference, or forbidden association.

== Recurrences

Possible recurrences include:

* Tziphora noticing an image in the book.
* A recovered visual fragment.
* A connection to Abramson's photograph thread.
* ATON correlating visual memory across suppressed datasets.

== Related Characters

* Tziphora Cohen
* Girl in Red Coat
* ATON
* Professor Shlomo Abramson

== Related Events

* Tziphora discovers "Night"
* Show and Tell
* ATON recovers the link

== Canon Constraints

* The symbol should remain concrete before it becomes interpretive.
* Avoid making the red coat merely decorative.
* The red coat should emphasize personhood and witness.
* The connection to the Abramson and ATON threads should remain open until later canon fixes it.

== Open Questions

* Is the red coat directly visible in the book?
* Is it connected to Abramson's photograph?
* Does ATON recover the red coat as a visual association?
EOF

write_file "canon/mysteries/mystery-girl-in-red-coat.adoc" <<'EOF'
= Mystery: Girl in Red Coat
:entry-type: MYSTERY
:status: CANON
:created: 2026-06-18
:checkpoint: checkpoint-initial-canon-2026-06-25
:provenance-id: prov-0001-tziphora-opening-thread

== Summary

A visually or historically significant girl associated with a red coat, whose identity and connection to the recovered memory threads remain unresolved.

== Canonical Content

The girl in the red coat is one of the story's central mystery figures.

She connects image, memory, historical witness, and suppressed association.

Her exact identity is not yet fixed.

== What Readers Know

Readers know that the image or idea of the girl disturbs the narrative surface.

She appears to matter before the characters understand why.

== What Characters Know

Tziphora:: Notices something before she can interpret it.
Teacher:: May redirect or suppress the discomfort without understanding it.
Professor Abramson:: May be connected through historical or visual witness.
ATON:: May later recover the link through machine association.

== Hidden Information

The exact relationship between the girl, the book, the red coat, Abramson's photograph, and ATON's recovered memory remains unresolved.

== Revelation Order

The mystery should unfold gradually:

. Tziphora encounters a troubling image or reference.
. The classroom fails to interpret it truthfully.
. Abramson's photograph thread introduces visual witness.
. ATON later correlates fragments.
. The girl becomes recognizable as a person, not a symbol or category.

== Related Themes

* Memory
* Witness
* Historical specificity
* Managed forgetting
* Epistemic closure
* Personhood

== Associated Characters

* Tziphora Cohen
* Teacher
* Professor Shlomo Abramson
* ATON
* Shmuel Abramson

== Provenance

See prov-0001-tziphora-opening-thread.

== Open Questions

* Who is the girl?
* Is she in "Night", in a photograph, or in recovered visual fragments?
* Does she connect directly to Shmuel Abramson?
* Does ATON recover her identity?
EOF

write_file "canon/provenance/prov-0001-tziphora-opening-thread.adoc" <<'EOF'
= Provenance: Tziphora Opening Thread
:entry-type: PROVENANCE
:status: CANON
:created: 2026-06-18
:checkpoint: checkpoint-initial-canon-2026-06-25

== Provenance ID

prov-0001

== Decision

Establish Tziphora's discovery of the book "Night" as the narrative opening thread.

== Origin

Tziphora's discovery was selected as the opening because it allows the story to begin with curiosity, material witness, and incomplete understanding rather than exposition.

== Source Fragments

* Tziphora discovers a copy of "Night" in the attic.
* The discovery occurs before the operational deployment of PURGE.
* Tziphora later brings the book to show and tell.
* The Teacher represents ordinary sanctioned interpretation.
* The girl in the red coat emerges as an unresolved mystery.
* The red coat functions as a visual marker of personhood and historical specificity.

== Decision Type

OPENING_CANONIZATION

== Reason Adopted

The Tziphora opening thread creates a child-level encounter with forbidden memory before the story introduces the technical and systemic dimensions of forgetting.

== Related Entries

* Character: Tziphora Cohen
* Character: Teacher
* Artifact: Book "Night"
* Timeline: Tziphora Discovers Night
* Timeline: Show and Tell
* Symbol: Red Coat
* Mystery: Girl in Red Coat

== Canon Constraints

* The opening should not explain too much.
* Tziphora should remain epistemically limited.
* The Teacher should not be treated as a secret conspirator.
* The discovery should precede PURGE deployment.
* The mystery of the girl in the red coat should remain open.

== Revision History

Initial canon slice established during early canon-entry bootstrapping.
EOF

print_completion "Tziphora canon slice"
