local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local i = ls.insert_node
local c = ls.choice_node
local postfix = require("luasnip.extras.postfix").postfix

local function get_component_name()
  return vim.fn.expand("%:t:r")
end

local function getPostfixMatch(_, parent)
  return parent.snippet.env.POSTFIX_MATCH
end

return {
  s("tplReactBasicComponent", {
    t({ "import React from 'react';", "", "interface " }),
    f(get_component_name),
    t({ "Props {" }),
    i(1),
    t({ "}", "", "const " }),
    f(get_component_name),
    t({ ": React.FC<" }),
    f(get_component_name),
    t({ "Props> = (props) => {", "  return (<>" }),
    i(0),
    t({ "</>);", "};", "", "export default " }),
    f(get_component_name),
    t(";"),
  }),
  s({ trig = ",,", snippetType = "autosnippet" }, {
    t("("),
    i(1),
    t(") => {"),
    i(0),
    t("}"),
  }, { hidden = true }),
  postfix({ trig = ".log", snippetType = "autosnippet" }, {
    t("console.log('"),
    f(getPostfixMatch, {}),
    t(": ', "),
    f(getPostfixMatch, {}),
    t(");"),
  }),
  postfix({ trig = ".var", snippetType = "autosnippet" }, {
    c(1, {
      t("const "),
      t("let "),
    }),
    f(getPostfixMatch, {}),
    t(" = "),
    i(0),
  }),
}
