---@diagnostic disable: undefined-global,lowercase-global

home_tree       = os_getenv("XDG_DATA_HOME") .. "/luarocks";
rocks_trees     = {
	{ name = "user",   root = home_tree };
	{ name = "system", root = os_getenv("LUAROCKS_HOME") or home_tree };
}
