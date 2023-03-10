#!/bin/bash

# DESCRIPTION:
# This BASH script creates the Muzzle.lua file from the Muzzle.txt file.
# It was created in a Linux Operating System and may not work on other O/S.
# Hand editing the Muzzle.lua file is also possible.
# This script may make it easier by not having to worry about quotes, commas, and tabs.

# NOTE:
# Muzzle.lua should be moved from the Extra folder into the Muzzle folder if created with this script.

# Sort file and remove duplicates.
sort --unique Muzzle.txt > Muzzle.lua

# Add single quotes around lines and a comma.
# -i tells it to do it inline (overwriting the same file).
sed -i "s/^/'/;s/$/',/" Muzzle.lua

# Insert TAB before each line.
sed -i 's/^/\t/' Muzzle.lua

# Insert the following lines to beginning of the file:
sed -i '1i\-- Muzzle (Muzzle.lua)\n\n-- Edit this list of names and words to muzzle, by hand, \n-- or with the provided BASH script "../Extra/Muzzle.sh" & "Muzzle.txt":\n\nMuzzle = {' Muzzle.lua

# Remove the last comma in the file.
sed -i '$ s/.$//' Muzzle.lua

# Append } to the end of the file:
# $ selects the end of file, and the a tells it to append.
sed -i '$ a }' Muzzle.lua
