telemetry = {
}

disable_mlock = true

ui = true

api_addr = "${VAULT_ADDR}"

listener "tcp" {
	address     = "[::]:8200"
	tls_disable = 1
}

listener "unix" {
	address     = "${XDG_RUNTIME_DIR}/vault.sock"
	socket_mode = "644"
}

storage "file" {
	path = "${XDG_DATA_HOME}/vault/storage"
}

plugin_directory = "${XDG_DATA_HOME}/vault/plugins"
