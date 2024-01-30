{ nixpkgs }:
''
  status --is-interactive; and begin

    set fish_greeting
    set --export GIT_EDITOR editor-cdm
    set --export EDITOR editor-cdm

    ${import ./abbreviations.nix { inherit nixpkgs; }}

    ${import ./functions.nix { inherit nixpkgs; }}

    alias ls 'ls --color --group-directories-first'

  end
''
