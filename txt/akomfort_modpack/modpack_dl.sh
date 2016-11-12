# This script downloads/updates the akomfort modpack

echo "Creating folder if not existent…"
mkdir -p akomfort
cd akomfort
echo "Download or update mods…"
echo -e -n "\033[2m"
curl -s https://raw.githubusercontent.com/HybridDog/miscellaneous/master/txt/akomfort_modpack/generated_commands | xargs -P0 -L1 -I {} sh -c "{}"
echo -e -n "\033[0m"
echo "Done!"
