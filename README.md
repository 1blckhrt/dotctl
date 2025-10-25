# dotctl
> A fast, reliable dotfiles manager written in Rust for the command line.

---

## ✨ Features
- ⚙️ **Backups** — Save all your config files with one command.
- 📦 **Versions** — Keep track of changes to your dotfiles over time.
- 🛠️ **Configuration** — Choose which files and directories to manage.

---

## 🚀 Getting Started

TODO

## 🧰 Usage

Initialize a dotctl workspace in your home directory:

```bash
dotctl init
```

Add a file or directory to be managed:

```bash
dotctl add ~/.bashrc
```

Backup your dotfiles:

```bash
dotctl backup
```

List all managed dotfiles:

```bash
dotctl list
```

---

## 🧠 Configuration

`dotctl` stores its metadata in `~/.config/dotctl/config.toml`.
You can customize paths and settings by editing this file.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

If you use Nix, you can set up a development environment with `direnv` and the flake provided in the repository:

```bash
direnv allow
```

## 📄 License

TODO