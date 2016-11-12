# This script downloads/updates the akomfort modpack

echo "Creating folder if not existent…"
mkdir -p akomfort
cd akomfort
echo "Download or update mods…"
curl -s ## | xargs -P0 -L1 -I {} sh -c "{}"
echo "Done!"
