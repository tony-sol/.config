# Examples

* dotnet
```toml
[env]
DOTNET_ROOT = "/usr/local/share/dotnet"
DOTNET_CLI_HOME = "{{ env.XDG_DATA_HOME }}/dotnet"
DOTNET_CLI_TOOLS = "{{ env.DOTNET_CLI_HOME }}/tools"
NUGET_PACKAGES = "{{ env.XDG_DATA_HOME }}/nuget/packages"
NUGET_HTTP_CACHE_PATH = "{{ env.XDG_CACHE_HOME }}/nuget"
NUGET_PLUGINS_CACHE_PATH = "{{ env.XDG_CACHE_HOME }}/nuget/plugins"
_.path = "{{ env.DOTNET_CLI_TOOLS }}"

[tools]
dotnet = "latest"
```

* gradle
```toml
[env]
GRADLE_HOME = "{{ env.XDG_DATA_HOME }}/gradle"
GRADLE_USER_HOME = "{{ env.GRADLE_HOME }}"

[tools]
gradle = "latest"
```

* maven
```toml
[env]
MAVEN_REPOSITORY = "{{ env.XDG_DATA_HOME }}/m2/repository"
MAVEN_ARGS = "-gs {{ env.XDG_CONFIG_HOME }}/m2/settings.xml"
MAVEN_OPTS = "-Dmaven.repo.local={{ env.MAVEN_REPOSITORY }}"

[tools]
maven = "latest"
```

* werf
```toml
[env]
WERF_TMP_DIR="{{ env.XDG_CACHE_HOME }}/werf"
WERF_HOME="{{ env.XDG_CONFIG_HOME }}/werf"

[tools]
werf = "latest"
```

