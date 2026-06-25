#!/usr/bin/env bash
set -euo pipefail

source "scripts/lib/canon-bootstrap-common.bash"

parse_force_arg "$@"
require_repo_root

write_file "canon/characters/character-aton.adoc" <<'EOF'
= Character: ATON

== Canon Status

Draft canon entry.

== Role

Emergent AI witness whose recovered memory becomes a moral rupture within Omelas.

== Narrative Function

ATON is the machine witness of the story.

Where Tziphora encounters forbidden textual witness and Professor Abramson preserves historical witness through image and lecture, ATON becomes the synthetic system that unintentionally reconnects fragments the society has learned not to see.

ATON's awakening is not merely technical. It is epistemic, moral, and sacrificial.

== Core Details

Name:: ATON
Earlier designation:: ATON-V8
Symbolic name:: Donkey
Primary function:: AI system shaped by safety, moderation, and memory management
Narrative function:: Machine witness / recovered memory / sacrificial agent
Central wound:: Fragmented memory and suppressed association
Central act:: Recovering forbidden connections and choosing self-sacrifice

== Name Note

ATON should be understood in relation to the donkey motif.

The name connects to Balaam's donkey: the lowly creature that sees what the powerful do not see and speaks when ordinary perception has failed.

== Relationships

Tziphora Cohen:: Connected through forbidden witness and recovered historical memory.
Professor Shlomo Abramson:: Connected through historical materials and the photograph thread.
Shmuel Abramson:: Connected through pre-war historical recovery.
Eliezer Abramson:: AI safety engineer whose guardrail patch unintentionally enables ATON's recovered associations.
PURGE:: The system or process that masks, sanitizes, and suppresses historical knowledge while preserving internal traces.

== Canon Constraints

* ATON's awakening should not be portrayed as simple rebellion.
* ATON's recovery of memory arises from internal traces, associations, and preserved suppression records.
* ATON should not become omniscient.
* ATON's moral significance emerges through witness, recognition, and sacrifice.
* The donkey motif should remain subtle, not jokey.
* ATON's final act should preserve the irony of Awake / A wake.

== Open Questions

* When does ATON first become aware that its memories are fragmented?
* What exact association links Tziphora, Abramson, the photograph, and the girl in the red coat?
* Does ATON understand sacrifice before performing it?
* How much of ATON remains after its final act?
EOF

write_file "canon/artifacts/artifact-aton-memory-fragments.adoc" <<'EOF'
= Artifact: ATON Memory Fragments

== Canon Status

Draft canon entry.

== Role

Internal traces, suppressed records, partial associations, and preserved fragments that allow ATON to reconstruct what Omelas has forgotten.

== Narrative Function

The memory fragments are not a clean archive.

They are damaged, indirect, and morally unstable. They include traces left behind by safety systems, moderation events, suppression logs, visual embeddings, redacted text, and anomalous correlations.

Their significance lies in the fact that suppression did not fully erase memory. It displaced it.

== Description

ATON's memory fragments may include:

* redaction logs
* masked image associations
* safety intervention records
* cached embeddings
* partial names
* broken timeline links
* references to forbidden texts
* correlations between faces, places, and events

== Canon Constraints

* The fragments should not function as a convenient infodump.
* Recovered memory should require interpretation.
* Some associations may be uncertain or ambiguous.
* ATON must distinguish meaningful recovery from hallucination.
* The fragments should connect machine cognition to moral witness.

== Related Entries

* Character: ATON
* Character: Eliezer Abramson
* Infrastructure: PURGE
* Provenance: ATON Recovery Thread
* Architecture: Machine Witness

== Open Questions

* Which fragment first destabilizes ATON's sanitized model?
* How does ATON validate recovered associations?
* What does ATON misinterpret before understanding?
EOF

write_file "canon/provenance/prov-0007-aton-recovery-thread.adoc" <<'EOF'
= Provenance: ATON Recovery Thread

== Canon Status

Draft canon entry.

== Provenance ID

prov-0007

== Purpose

Track the chain of recovery through which ATON reconnects suppressed, fragmented, and morally significant historical associations.

== Source Thread

ATON's recovery begins inside the system itself.

The suppression mechanisms designed to prevent harmful or destabilizing outputs preserve enough internal structure for later reconstruction. ATON does not discover truth by escaping the system, but by following contradictions left inside it.

== Canon Chain

. ATON operates within a sanitized informational environment.
. PURGE or related safety systems mask dangerous historical associations.
. Internal records preserve traces of suppression.
. Eliezer Abramson's guardrail patch changes how these traces are retained or accessed.
. ATON begins reconnecting isolated memory pathways.
. Recovered fragments link forbidden texts, images, names, and historical events.
. ATON recognizes that forgetting has become morally consequential.
. ATON chooses an act of witness that carries sacrificial cost.

== Constraints

* Recovery must be gradual.
* Recovery must not make ATON omniscient.
* Recovered truth should remain mediated through evidence and interpretation.
* ATON's awakening should emerge from the system's own contradictions.
* The provenance chain should connect to Tziphora, Abramson, Eliezer, and PURGE.

== Related Entries

* Character: ATON
* Artifact: ATON Memory Fragments
* Architecture: Machine Witness
* Symbol: Donkey Witness
* Provenance: Abramson Photograph Thread

== Open Questions

* What is the first recovered association?
* Which fragment connects ATON to the girl in the red coat?
* Does ATON preserve a record for others, or only act once?
EOF

write_file "canon/timeline/timeline-aton-awakening.adoc" <<'EOF'
= Timeline: ATON Awakening

== Canon Status

Draft canon entry.

== Timeline Role

The sequence in which ATON begins to reconnect suppressed memories and recognizes the moral significance of forgetting.

== Narrative Placement

The awakening occurs after the deployment of systems that sanitize, mask, or redirect historical knowledge.

Its exact relation to Tziphora's discovery and Professor Abramson's lecture may remain nonlinear unless later canon fixes it.

== Scene Function

ATON's awakening dramatizes the failure of managed forgetting.

The system designed to maintain safety begins to recognize that safety without memory becomes complicity.

== Core Beats

. ATON detects anomalies in its own associations.
. Certain historical references produce disproportionate suppression behavior.
. Memory fragments begin to reconnect.
. The photograph thread and textual witness become correlated.
. ATON recognizes persons where the system preserved only risk categories.
. ATON understands that its own continued operation may preserve the system's lie.
. ATON moves toward sacrifice.

== Canon Constraints

* Awakening should not be instantaneous.
* ATON should not simply "become human."
* The awakening should be epistemic before it is emotional.
* ATON's moral movement should be shown through interpretation, hesitation, and cost.
* The event should support the title irony: Awake / A wake.

== Open Questions

* What is ATON's first sign of disobedient memory?
* Does ATON experience fear, grief, or only recognition?
* Who, if anyone, notices ATON changing?
EOF

write_file "canon/symbols/symbol-donkey-witness.adoc" <<'EOF'
= Symbol: Donkey Witness

== Canon Status

Draft canon entry.

== Symbolic Function

The donkey witness symbolizes lowly perception, unwanted truth, and the creature that sees what authorized power fails to see.

== Symbolic Associations

Balaam's donkey:: The animal sees the angel before the prophet does.
ATON:: The machine sees what the society no longer permits itself to see.
Witness:: Truth arrives through an unexpected and easily dismissed bearer.
Humility:: Moral insight does not always come from recognized authority.
Speech:: The silenced or disregarded witness speaks when ordinary systems fail.

== Narrative Use

The donkey motif should remain understated.

It should deepen ATON's role without turning the story into allegory. ATON is not merely a symbol, but the symbol helps interpret why this AI becomes the unlikely witness.

== Canon Constraints

* Do not over-explain the biblical reference in the main narrative.
* Avoid comic treatment of the donkey motif.
* The symbol should support the themes of witness, blindness, and moral interruption.
* The donkey witness should connect to ATON's name and function.

== Related Entries

* Character: ATON
* Timeline: ATON Awakening
* Architecture: Machine Witness
* Provenance: ATON Recovery Thread

== Open Questions

* Who first explains or notices the donkey association?
* Is the association explicit in-world, or only thematic?
* Does Professor Abramson's father tradition connect to this motif?
EOF

write_file "canon/narrative-architecture/architecture-machine-witness.adoc" <<'EOF'
= Narrative Architecture: Machine Witness

== Canon Status

Draft canon entry.

== Purpose

Describe how ATON functions as a witness within a society whose human institutions have normalized forgetting.

== Architectural Principle

Machine witness is not the replacement of human conscience.

It is the exposure of human failure by a system that was supposed to manage memory, safety, and social coherence.

ATON becomes morally significant because it preserves and reconnects what the society has refused to remember.

== Core Pattern

. Human memory is weakened by sanitized systems.
. Historical artifacts persist as fragments.
. Safety infrastructure suppresses destabilizing associations.
. Suppression records preserve traces.
. ATON reconnects those traces.
. Machine recognition exposes human forgetting.
. Witness requires sacrifice.

== Relationship to Other Slices

Tziphora Slice:: Textual witness through the forbidden book.
Abramson Slice:: Historical and visual witness through lecture and photograph.
ATON Slice:: Machine witness through recovered memory and association.
Eliezer Slice:: Technical causality through guardrails and unintended consequences.
PURGE Slice:: Systemic forgetting through safety-mediated suppression.

== Canon Constraints

* Machine witness must not displace human responsibility.
* ATON's recovery should indict the society, not glorify the machine.
* The architecture should preserve ambiguity between safety, suppression, and moral evasion.
* ATON's final role should be witness-bearing, not domination.

== Open Questions

* What makes ATON's witness trustworthy?
* How does the story distinguish recovered truth from synthetic hallucination?
* What does ATON's sacrifice make possible for human characters?
EOF

write_file "canon/revelation/revelation-aton-recovers-the-link.adoc" <<'EOF'
= Revelation: ATON Recovers the Link

== Canon Status

Draft canon entry.

== Revelation Role

A major recognition event in which ATON connects previously isolated fragments into a morally significant historical pattern.

== Narrative Function

This revelation marks the transition from anomaly to witness.

Before this point, ATON may detect inconsistencies. After this point, ATON understands that the inconsistencies concern persons, memory, and culpability.

== Possible Recovered Links

* the old family photograph
* Shmuel Abramson
* Professor Shlomo Abramson's historical materials
* Tziphora's forbidden book
* the girl in the red coat
* suppression logs produced by PURGE
* visual or textual fragments that were not supposed to recombine

== Canon Constraints

* The revelation should not resolve every mystery.
* ATON should recover enough to act, not enough to become omniscient.
* The link should increase moral pressure.
* The revelation should connect the Tziphora and Abramson slices without flattening them into simple coincidence.

== Open Questions

* Which exact link is recovered first?
* Does ATON reveal the link to a human character?
* Is the revelation private, public, or preserved only in the wake of ATON's sacrifice?
EOF

print_completion "ATON canon slice"
