
{ ... }: 

{ # Add notification system for alerts.
  config.plugins.mini.modules.notify = {
    lsp_progress = {
      enable = true;
      level = "INFO";
      duration_last = 1000;
    };
  };
}

