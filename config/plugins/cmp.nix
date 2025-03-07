{ ... }:

{
  config.plugins.cmp = {
    enable = true;
    settings = {
      sources = [
        { name = "path"; }
        { name = "buffer"; }
      ];
      mapping = {
        "<CR>" = /*lua*/ ''
        cmp.mapping.confirm({
          select = false,
          behavior = cmp.ConfirmBehavior.Replace
        })
        '';

        "<Tab>" = /*lua*/ ''
        cmp.mapping(cmp.mapping.select_next_item({
          behavior = cmp.SelectBehavior.Select
        }), {"i", "s"})
        '';

        "<S-Tab>" = /*lua*/ ''
        cmp.mapping(cmp.mapping.select_prev_item({
          behavior = cmp.SelectBehavior.Select
        }), {"i", "s"})
        '';


        "<C-Space>" = "cmp.mapping.complete()";
        "<C-e>" = "cmp.mapping.close()";
        "<C-d>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
      };
    };
  };
}
