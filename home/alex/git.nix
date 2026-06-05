{ pkgs, vars, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user.name = vars.fullName;
      user.email = vars.email;
    };

    ignores = [
      ".DS_Store"
      "Thumbs.db"
      ".direnv"
      ".envrc"
      ".vscode"

      "__pycache__"
      "*.pyc"
      ".pytest_cache"
      ".mypy_cache"
      ".ruff_cache"

      ".venv"
      "venv"

      "dist"
      "build"
    ];
  };

  home.packages = with pkgs; [
    lazygit
  ];
}
