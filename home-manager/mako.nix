{ ... }:

{
  # Notification Manager
  services.mako = {
    enable = true;
    settings = {
      sort = "-time";
      ignore-timeout = 1;
      default-timeout = 3000;
      max-visible = 4;
      font = "JetBrainsMonoNerdFont Normal Regular 10";
    };
  };
}
