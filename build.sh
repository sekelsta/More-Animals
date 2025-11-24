# To define the environment variable, put something like this in your .bashrc file:
# export VINTAGE_STORY_DATA="$HOME/.config/VintageStoryData"

# Intention: VINTAGE_STORY points to your Vintage Story install location
# while VINTAGE_STORY_DATA points to your Vintage Story data location
# Depending on how you set up those environment variables, you could use
# a different game install between playing and devving, or just a different
# data folder location (using the --dataPath argument on startup)

RED='\033[0;31m'
NC='\033[0m' # No Color

null_textured_shapes=$(grep -rl "#null" assets/)
# Only print anything if files were found
if [[ -n $null_textured_shapes ]]; then
    echo -e "${RED}These shape files contain null textures:"
    echo -e "${null_textured_shapes}${NC}"
fi

zip -r MoreAnimals-1.7.0.zip assets/ modicon.png modinfo.json
rm "${VINTAGE_STORY_DATA}"/Mods/MoreAnimals*.zip
mv MoreAnimals*.zip "${VINTAGE_STORY_DATA}/Mods"
