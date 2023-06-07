lua_interpreter = "lua5.4";
home_tree       = os_getenv("XDG_DATA_HOME") .. "/luarocks";
rocks_trees     = {
	{ name = "user",   root = home_tree };
	{ name = "system", root = os_getenv("HOMEBREW_PREFIX") };
}
