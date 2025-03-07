{ ... }:

{
  config.plugins.luasnip = {
    enable = true;
    settings = {
      enable_autosnippets = true;
      store_selection_keys = "<Tab>";
    };
    fromSnipmate = [{
      lazyLoad = true;
      paths = ["~/.config/snippets"];
    }];
  };

  config.plugins.cmp = {
    settings = {
      sources = [
        { name = "luasnip"; }
      ];
      snippet.expand = /*lua*/ ''
      function(args) 
        require('luasnip').lsp_expand(args.body) 
      end
      '';
    };
  };
}
