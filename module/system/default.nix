{ config, pkgs, ... }:

{
    programs = {
        zsh = {
            enable = true;
            ohMyZsh = {
                enable = true;
                theme = "refined";
                plugins = [
                    "git"
                ];
            };

            autosuggestions.enable = true;
            enableCompletion = true;
            syntaxHighlighting.enable = true;
        };
    };
}
