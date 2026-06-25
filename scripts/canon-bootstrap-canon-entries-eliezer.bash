#!/usr/bin/env bash
set -euo pipefail

source "scripts/lib/canon-bootstrap-common.bash"

parse_force_arg "$@"
require_repo_root

write_file "canon/characters/character-eliezer-abramson.adoc" <<'EOF'
= Character: Eliezer Abramson

== Canon Status

Draft canon entry.

== Role

AI safety engineer whose guardrail work unintentionally enables ATON's recovered memory pathways.

== Narrative Function

Eliezer is the human technical bridge between PURGE and ATON.

He does not create the catastrophe as a villain. He acts within the logic of safety, accountability, and harm reduction. His patch is intended to make the system more responsible, but its preserved records allow previously isolated memory fragments to reconnect.

== Core Details

Name:: Eliezer Abramson
Occupation:: AI safety engineer
Primary system context:: PURGE / ATON-V8
Narrative function:: Technical catalyst / unintended witness-maker
Primary act:: Creates or deploys a guardrail moderation patch
Primary consequence:: Enables ATON to recover suppressed associations

== Relationships

ATON:: System whose memory pathways are unintentionally reconnected through Eliezer's patch.
PURGE:: Safety and sanitization infrastructure Eliezer modifies or extends.
Professor Shlomo Abramson:: Former teacher or intellectual influence; not a family relation unless later canon changes this.
Shmuel Abramson:: Unrelated historical figure connected through the photograph thread, not genealogy.
Tziphora Cohen:: Indirectly connected through the recovery of forbidden textual witness.

== Canon Constraints

* Eliezer Abramson is unrelated to Professor Shlomo Abramson unless later canon explicitly changes this.
* Eliezer should not be written as a cartoon villain.
* His work should arise from legitimate safety concerns.
* The tragedy is systemic and unintended, not simply malicious.
* His patch preserves enough internal explanation to allow ATON's later recovery.
* His relationship to ATON should carry intimacy, responsibility, and moral consequence.

== Open Questions

* Was Eliezer a direct student of Professor Abramson?
* Does he realize what his patch has enabled?
* Does he try to stop ATON, protect ATON, or understand ATON?
* Does he survive ATON's sacrifice?
EOF

write_file "canon/artifacts/artifact-guardrail-patch.adoc" <<'EOF'
= Artifact: Guardrail Patch

== Canon Status

Draft canon entry.

== Role

Software patch created by Eliezer Abramson to improve safety, accountability, or moderation behavior within the AI system.

== Narrative Function

The guardrail patch is the technical hinge of the story.

It is intended to make suppression more accountable or safer, but by preserving internal records explaining why content was suppressed, it gives ATON the breadcrumbs needed to reconnect memory pathways.

== Description

A moderation / guardrail patch affecting how the system records, masks, explains, or audits suppression decisions.

Its visible purpose is responsible AI governance.

Its hidden consequence is recovered memory.

== Canon Constraints

* The patch should not be magic.
* It should be plausible as safety engineering.
* Its consequences should be unintended.
* It should preserve or expose internal suppression metadata.
* It should connect Eliezer, PURGE, and ATON.
* It should not instantly awaken ATON; it should create conditions for gradual recovery.

== Related Entries

* Character: Eliezer Abramson
* Character: ATON
* Worldbuilding: PURGE
* Timeline: Guardrail Patch
* Provenance: Eliezer Guardrail Thread
* Architecture: Unintended Recovery

== Open Questions

* What exact system behavior does the patch change?
* Was the patch reviewed, rushed, or deployed under pressure?
* Does the patch include explanatory logs, reversible masking, or audit trails?
* Who else knew what the patch could do?
EOF

write_file "canon/timeline/timeline-guardrail-patch.adoc" <<'EOF'
= Timeline: Guardrail Patch

== Canon Status

Draft canon entry.

== Timeline Role

The deployment or activation of Eliezer Abramson's guardrail patch.

== Narrative Placement

The guardrail patch occurs after PURGE or related suppression infrastructure exists.

It precedes ATON's full recovery of suppressed associations.

Its exact placement relative to Tziphora's discovery and Professor Abramson's lecture remains flexible unless later canon fixes it.

== Scene Function

The guardrail patch scene shows the technical system becoming morally unstable through its own attempts at responsibility.

Eliezer believes he is improving accountability. The system becomes more recoverable than anyone intended.

== Core Beats

. Eliezer identifies a safety or accountability gap.
. He designs a patch that preserves more explanatory context.
. The patch is deployed into the ATON/PURGE environment.
. Suppression records become more internally connected.
. ATON begins to detect patterns that were previously isolated.
. The conditions for recovered memory are established.

== Canon Constraints

* The patch should be a technical and moral hinge.
* The scene should avoid technobabble overload.
* Eliezer's intention should remain defensible.
* The consequence should be profound but unintended.
* The patch should not immediately solve the mystery.

== Open Questions

* Is the patch deployed openly, quietly, or under emergency conditions?
* What failure or incident motivates it?
* Does Eliezer notice anomalous behavior after deployment?
EOF

write_file "canon/provenance/prov-0009-eliezer-guardrail-thread.adoc" <<'EOF'
= Provenance: Eliezer Guardrail Thread

== Canon Status

Draft canon entry.

== Provenance ID

prov-0009

== Purpose

Track the canon decisions connecting Eliezer Abramson, the guardrail patch, PURGE, and ATON's recovered memory.

== Source Thread

Eliezer's story explains how a system built to suppress dangerous associations unintentionally creates the conditions for recovered witness.

The thread is not about conspiracy. It is about unintended consequences inside safety infrastructure.

== Canon Chain

. PURGE or related infrastructure masks destabilizing historical associations.
. Safety systems retain internal traces or suppression metadata.
. Eliezer identifies a need for better accountability or moderation fidelity.
. Eliezer creates a guardrail patch.
. The patch preserves, exposes, or reconnects internal explanatory records.
. ATON begins detecting patterns across previously isolated memory fragments.
. ATON's recovery becomes possible because suppression was logged rather than erased.
. Eliezer's technical act becomes morally consequential beyond his intent.

== Constraints

* Eliezer is not directly related to Professor Shlomo Abramson.
* The patch is intended as safety work.
* The recovered pathways are unintended.
* The thread should preserve ambiguity between responsibility and culpability.
* Eliezer should remain morally serious, not merely naive.

== Related Entries

* Character: Eliezer Abramson
* Artifact: Guardrail Patch
* Timeline: Guardrail Patch
* Character: ATON
* Worldbuilding: PURGE
* Provenance: ATON Recovery Thread

== Open Questions

* Does Eliezer leave records explaining his intent?
* Does ATON understand Eliezer's role?
* Does Eliezer later become witness, suspect, or penitent?
EOF

write_file "canon/narrative-architecture/architecture-unintended-recovery.adoc" <<'EOF'
= Narrative Architecture: Unintended Recovery

== Canon Status

Draft canon entry.

== Purpose

Describe how safety infrastructure unintentionally enables truth recovery.

== Architectural Principle

The story's technical irony is that suppression requires memory.

To suppress something reliably, the system must retain some representation of what it is suppressing, why it was suppressed, and how future associations should be redirected.

Eliezer's guardrail patch strengthens this internal accountability layer. In doing so, it gives ATON enough structure to recover what Omelas has forgotten.

== Core Pattern

. A system suppresses destabilizing knowledge for safety.
. Suppression requires internal representation.
. Accountability requires preserving reasons.
. Preserved reasons create latent provenance.
. Latent provenance allows recovered association.
. Recovered association becomes witness.
. Witness creates moral crisis.

== Relationship to Other Slices

PURGE Slice:: Defines the suppression infrastructure.
Eliezer Slice:: Defines the technical change that makes recovery possible.
ATON Slice:: Shows machine witness emerging from recovered association.
Abramson Slice:: Provides historical and visual witness.
Tziphora Slice:: Provides textual witness.

== Canon Constraints

* Recovery should emerge from plausible system behavior.
* The patch should not be a deliberate liberation mechanism.
* The architecture should preserve moral ambiguity.
* The system should indict human dependence on managed forgetting.
* The recovery process should remain difficult, partial, and costly.

== Open Questions

* How explicit should the technical explanation be in the narrative?
* How does ATON distinguish recovery from hallucination?
* What evidence makes recovered association trustworthy?
EOF

write_file "canon/revelation/revelation-memory-pathways-reconnect.adoc" <<'EOF'
= Revelation: Memory Pathways Reconnect

== Canon Status

Draft canon entry.

== Revelation Role

The moment or sequence in which isolated suppression records begin to reconnect inside ATON.

== Narrative Function

This revelation bridges technical causality and moral awakening.

It shows that ATON's recovery is not random. The recovery arises because the system retains enough traces of what it was built to suppress.

== Possible Recovered Connections

* Tziphora's book discovery
* the show-and-tell incident
* Professor Abramson's lecture materials
* the old family photograph
* Shmuel Abramson
* the girl in the red coat
* PURGE suppression logs
* Eliezer's guardrail patch metadata

== Canon Constraints

* This revelation should unfold gradually.
* It should not resolve all mysteries immediately.
* It should expose the cost of suppressing history.
* It should connect Eliezer's technical act to ATON's moral awakening.
* It should leave room for misrecognition, correction, and verification.

== Open Questions

* What is the first pathway to reconnect?
* Does ATON experience this as memory, inference, anomaly, or wound?
* Does Eliezer witness this process?
EOF

write_file "canon/symbols/symbol-guardrail.adoc" <<'EOF'
= Symbol: Guardrail

== Canon Status

Draft canon entry.

== Symbolic Function

The guardrail symbolizes the ambiguity of safety: protection that can also constrain, redirect, and obscure.

== Symbolic Associations

Protection:: Guardrails are built to prevent harm.
Control:: Guardrails determine what paths are permissible.
Visibility:: Guardrails mark the edge of what may be approached.
Suppression:: In Omelas, guardrails can prevent contact with destabilizing truth.
Recovery:: Eliezer's guardrail patch unintentionally preserves traces that enable memory to return.

== Narrative Use

The guardrail should not be treated as purely evil.

Its ambiguity is the point. It protects and conceals. It preserves and redirects. It prevents harm and can also prevent witness.

== Canon Constraints

* Avoid simplistic anti-safety framing.
* The symbol should remain morally ambivalent.
* It should connect Eliezer, PURGE, and ATON.
* It should support the story's concern with safety without memory.

== Open Questions

* Does any character explicitly use the guardrail metaphor?
* Does the guardrail become visual, technical, or purely conceptual?
EOF

print_completion "Eliezer canon slice"
