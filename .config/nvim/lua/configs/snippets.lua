local snippets_plugin = require("snippets")
local U = require("snippets.utils")

local snips = {}

snips._global = {}
snips.c = {
    guard = [[
#ifndef ${1|S.v:gsub("%s+", "_")}_H_
#define ${|S[1]:gsub("%s+", "_")}_H_

$0

#endif // ${|S[1]:gsub("%s+", "_")}_H_
]];
    ["#if"] = [[
#if $1
$0
#endif // $1
]];
    ["inc"] = [[#include "$1"]];
    ["sinc"] = [[#include <$1>]];
    ["struct"] = U.match_indentation [[
typedef struct $1 {
  $0
} $1;
]];
    ["enum"] = U.match_indentation [[
typedef enum $1 {
  $0
} $1;
]];
    ["union"] = U.match_indentation [[
union $1 {
  $0
}
]];
    ["def"] = [[#define ]];
    ["for"] = U.match_indentation [[
for ($1; $2; $3) {
  $0
}]];
    ["fori"] = U.match_indentation [[
for (int ${1:i}; $1 < $2; $1++) {
  $0
}]];
  };

snippets_plugin.snippets = snips
snippets_plugin.use_suggested_mappings()
