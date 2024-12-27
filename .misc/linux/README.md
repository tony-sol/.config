# linux

## Move homebrew

> [!TIP]
> See also:
>   [Homebrew-on-Linux](https://docs.brew.sh/Homebrew-on-Linux),
>   [macos-defaults](https://macos-defaults.com)

> [!IMPORTANT]
> It's strongly recommended to create a separate user for linuxbrew
> ```shell
> sudo useradd --no-create-home linuxbrew
> sudo usermod --groups linuxbrew --append $USER
> ```

> [!WARNING]
> Assuming homebrew is already installed into default prefix and current user is in 'linuxbrew' group
> ```shell
> sudo install --directory /opt/linuxbrew/ --group linuxbrew --mode g+rwx
> sudo rsync --archive --human-readable --compress --chown root:linuxbrew --chmod g+rwx /home/linuxbrew/.linuxbrew/. /opt/linuxbrew/
> ```
