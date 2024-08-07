if not set --query --global MY_FUNC_SET
  set --global MY_FUNC_SET true
  
  function rmb
    git checkout -q main
    for branch in (git for-each-ref refs/heads/ --format='%(refname:short)')
      set mergeBase (git merge-base main $branch)
      if test (git cherry main (git commit-tree (git rev-parse "$branch^{tree}") -p $mergeBase -m _)) = "-*"
        git branch -D $branch
      end
    end
  end
end
