{ ... }:

{
  programs.git = {
    enable = true;

    userName = "Sam Burcksen";
    userEmail = "sam.burcksen@gmail.com";

    aliases = {
      # List aliases.
      aliases = "config --get-regexp alias";

      # Pull in remote changes for the current repository and all its submodules.
      p = "pull --recurse-submodules";

      # Clone a repository including all submodules.
      c = "clone --recursive";

      # Commit all changes.
      ca = "!git add ':(exclude,attr:builtin_objectmode=160000)' && git commit -av";

      # View abbreviated SHA, description, and history graph of the latest 20 commits.
      l = "log --pretty=oneline -n 20 --graph --abbrev-commit";

      # View the current working tree status using the short format.
      s = "status -s";

      # Show the diff between the latest commit and the current state.
      d = ''!"git diff-index --quiet HEAD -- || clear; git --no-pager diff --patch-with-stat"'';

      # Amend the currently staged files to the latest commit.
      amend = "commit --amend --reuse-message=HEAD";

      # Show the user email for the current repository.
      whoami = "config user.email";
    };

    extraConfig = {
      apply.whitespace = "fix";

      branch.sort = "-committerdate";

      color = {
        ui = "auto";
      };

      core = {
        editor = "nvim";

        # Speed up commands involving untracked files such as `git status`.
        # https://git-scm.com/docs/git-update-index#_untracked_cache
        untrackedCache = true;

        # Treat spaces before tabs and all kinds of trailing whitespace as an error.
        # [default] trailing-space: looks for spaces at the end of a line
        # [default] space-before-tab: looks for spaces before tabs at the beginning of a line
        whitespace = "space-before-tab,-indent-with-non-tab,trailing-space";
      };

      credential = {
        helper = "store";
      };

      init = {
        defaultBranch = "main";
      };

      push = {
        default = "simple";

        # Make `git push` push relevant annotated tags when pushing branches out.
        followTags = true;
      };
    };
  };
}
