{ nixpkgs }:
''
  status --is-interactive; and begin

    set fish_greeting
    set --export GIT_EDITOR vim
    set --export EDITOR vim

    ${import ./abbreviations.nix { inherit nixpkgs; }}

    ${import ./functions.nix { inherit nixpkgs; }}

    alias ls 'ls --color --group-directories-first'

  end
''
