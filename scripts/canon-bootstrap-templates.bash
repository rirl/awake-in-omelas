#!/usr/bin/env bash
set -euo pipefail

# -------------------------------------------------------------------
# feature/canon-templates
# Creates the canonical template structure for Awake in Omelas
# -------------------------------------------------------------------

mkdir -p templates

touch \
    templates/character-template.adoc \
    templates/timeline-template.adoc \
    templates/artifact-template.adoc \
    templates/theme-template.adoc \
    templates/mystery-template.adoc \
    templates/revelation-template.adoc \
    templates/worldbuilding-template.adoc \
    templates/narrative-architecture-template.adoc \
    templates/provenance-template.adoc \
    templates/checkpoint-template.adoc

cat > templates/character-template.adoc <<'EOF'
= <Character Name>

Entry ID:
Entry Type: CHARACTER
Status:

== Summary

== Canonical Content

== Narrative Purpose

== Character Arc

== Relationships

== Associated Themes

== Associated Artifacts

== Associated Mysteries

== Associated Timeline Entries

== Knowledge State

What does this character currently know?

== Provenance

Origin:

Adoption Date:

Originating Discussion:

Reason For Adoption:

Superseded Alternatives:

Confidence:

== Revision History

== Open Questions

== Speculation
EOF

cat > templates/timeline-template.adoc <<'EOF'
= <Timeline Event>

Entry ID:
Entry Type: TIMELINE
Status:

== Summary

== Canonical Content

== Narrative Purpose

== Relative Ordering

Before:

After:

Concurrent With:

== Participants

== Associated Mysteries

== Associated Artifacts

== Provenance

Origin:

Adoption Date:

Reason For Adoption:

Confidence:

== Revision History

== Open Questions

== Speculation
EOF

cat > templates/artifact-template.adoc <<'EOF'
= <Artifact>

Entry ID:
Entry Type: ARTIFACT
Status:

== Summary

== Canonical Content

== Narrative Purpose

== Physical Description

== Ownership History

== Associated Characters

== Associated Mysteries

== Provenance

Origin:

Adoption Date:

Reason For Adoption:

Confidence:

== Revision History

== Open Questions

== Speculation
EOF

cat > templates/theme-template.adoc <<'EOF'
= <Theme>

Entry ID:
Entry Type: THEME
Status:

== Summary

== Canonical Content

== Narrative Purpose

== Associated Characters

== Associated Events

== Associated Artifacts

== Provenance

Origin:

Adoption Date:

Reason For Adoption:

Confidence:

== Revision History

== Open Questions

== Speculation
EOF

cat > templates/mystery-template.adoc <<'EOF'
= <Mystery>

Entry ID:
Entry Type: MYSTERY
Status:

== Summary

== Canonical Content

== What Readers Know

== What Characters Know

== Hidden Information

== Revelation Order

== Related Themes

== Associated Characters

== Provenance

Origin:

Adoption Date:

Reason For Adoption:

Confidence:

== Revision History

== Open Questions

== Speculation
EOF

cat > templates/revelation-template.adoc <<'EOF'
= <Revelation Event>

Entry ID:
Entry Type: REVELATION
Status:

== Summary

== Revealed Information

== Who Learns It

== Who Already Knew

== Narrative Purpose

== Emotional Effect

== Dependencies

Requires:

== Future Consequences

== Provenance

Origin:

Adoption Date:

Reason For Adoption:

Confidence:

== Revision History

== Open Questions

== Speculation
EOF

cat > templates/worldbuilding-template.adoc <<'EOF'
= <Worldbuilding Element>

Entry ID:
Entry Type: WORLDBUILDING
Status:

== Summary

== Canonical Content

== Narrative Purpose

== Constraints

== Related Elements

== Provenance

Origin:

Adoption Date:

Reason For Adoption:

Confidence:

== Revision History

== Open Questions

== Speculation
EOF

cat > templates/narrative-architecture-template.adoc <<'EOF'
= <Narrative Structure>

Entry ID:
Entry Type: NARRATIVE_ARCHITECTURE
Status:

== Summary

== Canonical Content

== Narrative Function

== Dependencies

== Associated Characters

== Associated Mysteries

== Provenance

Origin:

Adoption Date:

Reason For Adoption:

Confidence:

== Revision History

== Open Questions

== Speculation
EOF

cat > templates/provenance-template.adoc <<'EOF'
= Provenance Record

Origin:

Adoption Date:

Originating Discussion:

Reason For Adoption:

Superseded Alternatives:

Confidence:

Revision History:
EOF

cat > templates/checkpoint-template.adoc <<'EOF'
= <Checkpoint>

Version:

Status:

Phase:

Completed Milestones:

Next Milestone:

Repository State:

Notes:
EOF

echo
echo "Canonical template structure created successfully."
echo
echo "Next:"
echo "  git add templates"
echo "  git commit -m 'feat: add canonical entry templates'"