## Install Starship

1. Install the binary

```bash
# On Linux
curl -sS https://starship.rs/install.sh | sh
# On Mac
brew install starship
```

2. Add initialization to the shell config file

   ```bash
   # For Linux
   echo 'eval "$(starship init bash)" ' >> ~/.bashrc
   source ~/.bashrc

   # For Mac
   echo 'eval "$(starship init zsh)" ' >> ~/.zshrc
   source ~/.zshrc
   ```
3. The configuration file is named `starship.toml`, and by default, it's located in the following paths  `~/.config/starship.toml`
4. Preset config for starship

   ```bash
   starship preset nerd-font-symbols -o ~/.config/starship.toml
   starship preset bracketed-segments -o ~/.config/starship.toml
   ```

### Ref Links:

https://starship.rs/guide/
https://github.com/ryanoasis/nerd-fonts?tab=readme-ov-file#option-1-release-archive-download

### Adding External Fonts in Starship

Download or Copy the additional fonts to the below location to use in Starship terminal.

Font Location:

- Mac = /Users/`<user>`/Library/Fonts
- Linux = .local/share/fonts

## Uninstall Starship

Starship is just as easy to uninstall as it is to install in the first place.

1. Remove any lines in your shell config (e.g. ~/.bashrc) used to initialize Starship.
2. Delete the Starship binary.
   * If Starship was installed using a package manager, please refer to their docs for uninstallation instructions.
   * If Starship was installed using the install script, use the following command will delete the binary.
     ```bash
     # Locate and delete the starship binary
     sh -c 'rm "$(command -v 'starship')"'
     ```
