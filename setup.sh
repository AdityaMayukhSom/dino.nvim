# Trying to write an automated script which will load all the necessary dependencies
# 
# Each dependency should be added only after confirmation by the user except if -y flag is used
# in which case all of them should be added without any question.
#!/bin/bash


# In case the user selects no midway, all the already installed dependencies should be removed.
# We need to keep in mind only to remove the dependencies installed by this script.
# Previously installed dependencies should not be removed.


# work in progress, not ready for production.
if command -v rg &> /dev/null; then
    # ripgrep is used by telescope
    echo "'rg' command already exists."
else
    echo "'rg' command not installed."
fi

