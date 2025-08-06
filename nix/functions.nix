{ nixpkgs }:
''
  # Enhanced git status command. First just run a normal git status. Then
  # search for diffs that have added/removed the string "TODO" and display
  # the results. (Ideally this would only show additions, not removals.)
  function st
    git status; and begin
      set IFS (echo -en "\n\b")
      set todo (git diff HEAD --name-only -Gtodo)
      if test -n "$todo"
        echo '#'
        echo '# Todo:'
        echo '#'
        set c (echo -e '\e[0;34m')
        set r (echo -e '\e[0m')
        echo "$todo" | sed "s/.*/#       $c&$r/"
      end
    end
  end

  # Lists git branches in order of their last commit date, with most recent
  # branches appearing at the bottom. Shows date, committer, and branch name.
  function br
    git for-each-ref \
      --sort=committerdate refs/heads/ \
      --format='%(committerdate:short)%09%(authorname)%09%(refname:short)' \
      | column -t -s "(echo -e '\t')"
  end
''
