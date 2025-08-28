{ ... }:

{ # Harper is not a programming language, but a language server for grammar.
  config.plugins.lsp.servers.harper_ls = {
    enable = true;
    filetypes = [
      "text" "markdown" "rmd" "typst"
      # "tex" # NOTE: no tex support yet :(
    ];
    settings = {
      spell_check = true;
      spelled_numbers = true;
      an_a = true;
      sentence_capitalization = true;
      unclosed_quotes = true;
      wrong_quotes = false;
      long_sentences = true;
      repeated_words = true;
      spaces = true;
      matcher = true;
      correct_number_suffix = true;
    };
  };
}
