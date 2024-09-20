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

  function mp4merge
    # Clear the playlist file if it exists
    echo "" > playlist.txt

    # Loop through all mp4 files and add them to the playlist
    for f in *.mp4
      echo "file '$f'" >> playlist.txt
    end

    # Display confirmation
    echo "List saved to playlist.txt"
    bat playlist.txt

    # Run the basic ffmpeg command without re-encoding
    ffmpeg -f concat -safe 0 -i playlist.txt -c copy merged.mp4

    # Remove the playlist file after merging
    rm playlist.txt

    # Display confirmation of cleanup
    echo "Cleanup complete: playlist.txt removed."
  end
end
