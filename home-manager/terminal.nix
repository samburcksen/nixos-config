{ ... }:

{
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "JetBrainsMonoNFM-Regular:size=12";
        pad = "3x0";
      };
      colors.alpha = 0.8;
    };
  };
}
