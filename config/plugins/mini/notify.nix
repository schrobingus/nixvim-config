
{ ... }:

{ # Add notification system for alerts.
  config.plugins.mini.modules.notify = {
    lsp_progress = {
      # TODO: ltex spams the shit outta this. make a github issue on server specific notifications, inclusive or exclusive by list.
      enable = true;
      level = "INFO";
      duration_last = 1000;
    };
  };
}

