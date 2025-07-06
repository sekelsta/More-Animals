# To define the environment variable, put something like this in your .bashrc file:
# export VINTAGE_STORY_DEV="$HOME/software/vintagestory_dev"

RED='\033[0;31m'
NC='\033[0m' # No Color

null_textured_shapes=$(grep -rl "#null" assets/)
# Only print anything if files were found
if [[ -n $null_textured_shapes ]]; then
    echo -e "${RED}These shape files contain null textures:"
    echo -e "${null_textured_shapes}${NC}"
fi

mkdir -p Build/
rm -r Build/MoreAnimals-*.zip
mod_version=$(json5 modinfo.json | jq -r '.Version')
zip -qr "Build/MoreAnimals-${mod_version}.zip" assets/ modicon.png modinfo.json
rm "${VINTAGE_STORY_DEV}"/Mods/MoreAnimals-*.zip
cp Build/MoreAnimals-*.zip "${VINTAGE_STORY_DEV}/Mods"
