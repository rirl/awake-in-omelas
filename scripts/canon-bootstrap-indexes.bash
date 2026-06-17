#!/usr/bin/env bash
set -euo pipefail

# -------------------------------------------------------------------
# feature/canon-indexes
# Creates master index files for the Awake in Omelas canon.
# -------------------------------------------------------------------

mkdir -p indexes

cat > indexes/characters.adoc <<'EOF'
= Character Index

== Major Characters

|===
|Character |Status |Notes

|TBD
|UNDEFINED
|

|===
EOF

cat > indexes/timeline.adoc <<'EOF'
= Timeline Index

|===
|Event |Relative Position |Status

|TBD
|
|UNDEFINED

|===
EOF

cat > indexes/artifacts.adoc <<'EOF'
= Artifact Index

|===
|Artifact |Status |Notes

|TBD
|UNDEFINED
|

|===
EOF

cat > indexes/mysteries.adoc <<'EOF'
= Mystery Index

|===
|Mystery |State |Notes

|TBD
|UNDEFINED
|

|===
EOF

cat > indexes/themes.adoc <<'EOF'
= Theme Index

|===
|Theme |Status |Notes

|TBD
|UNDEFINED
|

|===
EOF

cat > indexes/revelations.adoc <<'EOF'
= Revelation Index

|===
|Revelation |State |Notes

|TBD
|UNDEFINED
|

|===
EOF

cat > indexes/worldbuilding.adoc <<'EOF'
= Worldbuilding Index

|===
|Element |Status |Notes

|TBD
|UNDEFINED
|

|===
EOF

cat > indexes/narrative-architecture.adoc <<'EOF'
= Narrative Architecture Index

|===
|Structure |Status |Notes

|TBD
|UNDEFINED
|

|===
EOF

cat > indexes/README.adoc <<'EOF'
= Canon Indexes

This directory contains the master indexes for the canonical
elements of the Awake in Omelas project.

== Indexes

* xref:characters.adoc[Character Index]
* xref:timeline.adoc[Timeline Index]
* xref:artifacts.adoc[Artifact Index]
* xref:mysteries.adoc[Mystery Index]
* xref:themes.adoc[Theme Index]
* xref:revelations.adoc[Revelation Index]
* xref:worldbuilding.adoc[Worldbuilding Index]
* xref:narrative-architecture.adoc[Narrative Architecture Index]

These files serve as navigational entry points into the canon.
EOF

echo
echo "Canon indexes created successfully."
echo
echo "Next steps:"
echo "  git add indexes"
echo "  git commit -m 'feat: add canon indexes'"
echo