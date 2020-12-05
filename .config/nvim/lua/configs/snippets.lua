local snippets = require("snippets")
local utils = require("snippets.utils")

local snips = {}

snips._global = {
    todo = "TODO(dink4n): ",
    note = "NOTE(dink4n): "
}

-- Language specific
snips.c = {
    ["inc"] = [[#include "$1"]],
    ["sinc"] = [[#include <$1>]]
}

snips.cpp = snips.c

snippets.snippets = snips
-- snippets.use_suggested_mappings()
require'snippets'.set_ux(require'snippets.inserters.vim_input')
