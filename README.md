# Carlie's Dotfiles and Settings

A collection of settings and dot files for my things!

## Basic Instructions

Copy the dot files to the root directory. Copy `keybindings.json` & `settings.json` to the [VS Code directory.](#VS-Code)

## Vim

```console
 sudo apt-get install vim
 ```

### Make it default❗️

```console
sudo update-alternatives --config editor
```

### Install Vundle

- [Vundle Plugin Manager](https://github.com/VundleVim/Vundle.vim)

1. Git clone [vundle](https://github.com/VundleVim/Vundle.vim)

```console
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

2. Make sure I have copied over my `.vimrc`
3. Install plugins from command line - `vim +PluginInstall +qall`

## VS Code

### Copying Over VS Code Settings

The location of the VS Code settings in linux:

`$HOME/.config/Code/User/settings.json`

### List of VS Code Plugins

- :emojisense:
- BracketPair Colorizer 2
- C#
- Code Spell Checker
- Code Time (Thinking of this to replace Wakatime)
- ESLint
- Error Lens
- GitLens
- LaserWave
- markdownlint
- Material Icon Theme
- Peacock
- REST Client
- SQL Server(mssql)
- Vim
- vscode-styled-components
- Wakatime

Plugins that maybe I like but I am just testing out:

- DotENV
- Draw.io Integration
- MDX
- TabNine

### I might make a script to install plugins

It's a thought. Have a look at [this page](https://stackoverflow.com/questions/34286515/how-to-install-visual-studio-code-extensions-from-command-line), Carlie.

```console
code --list-extensions
code --install-extension ms-vscode.cpptools
code --uninstall-extension ms-vscode.csharp
```

and looking at the `call` keyword, although that mentions a `.bat` script. Ooh, I'm excited, I'm going to do this when I make time.

## List of Other Settings and Repos and Things I Like To Have Installed

### [Emoji!](https://extensions.gnome.org/extension/1162/emoji-selector/)

This is so cool, I love this and couldn't survive without the emoji

Instructions for installation in the [github](https://github.com/maoschanz/emoji-selector-for-gnome), but at this point in time just need to click my emoji header up there ⬆️ and that will lead to installation 😀 🎉

### [Git Open](https://github.com/paulirish/git-open)

Install via npm:

```console
npm install --global git-open
```

### Handy programs to install as needed

- Flameshot - screenshotting tool
