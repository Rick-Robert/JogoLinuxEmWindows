#!/bin/bash 
# GOG.com (www.gog.com)
# Game

# Initialization 
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 
cd "${CURRENT_DIR}" 
source support/gog_com.shlib 

# Game info 
GAME_NAME="$(get_gameinfo 1)" 
VERSION="$(get_gameinfo 2)" 
VERSION_DEV="$(get_gameinfo 3)" 

# Actions
run_game() { 
echo "Running ${GAME_NAME}" 
cd "${CURRENT_DIR}/game" 
chmod +x * #Faz ser executável
 ./"Hollow Knight" -force-opengl #força a ser usado o OpenGL

}
default() { 
run_game
} 

# Options
define_option "-s" "--start" "start ${GAME_NAME}" "run_game" "$@" 

# Defaults
standard_options "$@" 
