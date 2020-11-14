# EDM prettified prompts and autocompletions for the Fish shell
# Copyright (C) 2020 Joris Vankerschaver
# SPDX-License-Identifier: BSD-3-Clause
#
# Based on the autocompletions for Conda, generated with 'conda init fish'
# Copyright (C) 2012 Anaconda, Inc
# SPDX-License-Identifier: BSD-3-Clause
#
# USAGE INSTRUCTIONS
#
#  1. Make sure EDM is on your path.
#  2. Source this file from within your config.fish.
#

set -gx _EDM_ROOT (edm info | string replace -fr "root directory:\s+" "")
set -gx _EDM_ENV_ROOT "$_EDM_ROOT/envs"

# XXX clean up path setting. This should not be nec
#set -g _EDM_BIN_ROOT (dirname $EDM_EXE)
# set -gx PATH $PATH $_EDM_BIN_ROOT

function __edm_add_prompt
  if set -q EDM_VIRTUAL_ENV
      set_color normal
      echo -n '('
      set_color -o green
      echo -n (basename $EDM_VIRTUAL_ENV)
      set_color normal
      echo -n ') '
  end
end

if functions -q fish_prompt
    functions -c fish_prompt __fish_prompt_orig_edm
    functions -e fish_prompt
else
    function __fish_prompt_orig_edm
    end
end

function return_last_status
  return $argv
end

function fish_prompt
  set -l last_status $status
  if set -q EDM_LEFT_PROMPT
      __edm_add_prompt
  end
  return_last_status $last_status
  __fish_prompt_orig
end

if functions -q fish_right_prompt
    functions -c fish_right_prompt __fish_right_prompt_orig_edm
    functions -e fish_right_prompt
else
    function __fish_right_prompt_orig_edm
    end
end
function fish_right_prompt
  if not set -q EDM_LEFT_PROMPT
      __edm_add_prompt
  end
  __fish_right_prompt_orig_edm
end

# Autocompletions below

function __fish_edm_extract_commands
    set matches (string match -r "^  [a-z][a-z\-]*" (eval $argv[1] "--help"))
    for match in $matches
	string trim $match
    end
end

function __fish_edm_envs
    for folder in (ls $_EDM_ENV_ROOT)
	if test -d "$_EDM_ENV_ROOT/$folder"
            echo $folder
	end
    end
end

function __fish_edm_packages
    string match -r "^[a-zA-Z_0-9]+" (edm list)
end

function __fish_edm_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'edm' ]
    return 0
  end
  return 1
end

function __fish_edm_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

# EDM environment completion
complete -f -c edm -n "__fish_contains_opt -s e environment" -a '(__fish_edm_envs)'

# EDM commands
complete -f -c edm -n '__fish_edm_needs_command' -a '(__fish_edm_extract_commands "edm")'
complete -f -c edm -n '__fish_edm_using_command env' -a '(__fish_edm_extract_commands "edm env")'
complete -f -c edm -n '__fish_edm_using_command envs' -a '(__fish_edm_extract_commands "edm env")'
complete -f -c edm -n '__fish_edm_using_command environment' -a '(__fish_edm_extract_commands "edm env")'

# Commands that need package as parameter. Note: these don't always work well
# (e.g. using the -e parameter with remove should prompt with packages from the
# target environment)
complete -f -c edm -n '__fish_edm_using_command remove' -a '(__fish_edm_packages)'
complete -f -c edm -n '__fish_edm_using_command uninstall' -a '(__fish_edm_packages)'
