# Carlie's Dotfiles and Settings

A collection of settings and dot files for my things!

## Basic Instructions

Copy the dot files to the root directory. Copy `keybindings.json` & `settings.json` to the [VS Code directory.](#VS-Code)

## Vim

```
 sudo apt-get install vim
 ```

### Make it default❗️

```
sudo update-alternatives --config editor
```

### Install Vundle

- [Vundle Plugin Manager](https://github.com/VundleVim/Vundle.vim)

1. Git clone [vundle](https://github.com/VundleVim/Vundle.vim)

```
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
- GitLens
- LaserWave
- markdownlint
- Material Icon Theme
- Peacock
- REST Client
- Vim
- Wakatime

Plugins that maybe I like but I am just testing out:

- DotENV
- Draw.io Integration
- MDX

## List of Other Settings and Repos and Things I Like To Have Installed

### [Emoji!](https://extensions.gnome.org/extension/1162/emoji-selector/)

This is so cool, I love this and couldn't survive without the emoji

Istructions for installation in the [github](https://github.com/maoschanz/emoji-selector-for-gnome), but at this point in time just need to click my emoji header up there ⬆️ and that will lead to installation 😀 🎉

### [Git Open](https://github.com/paulirish/git-open)

Install via npm:
```
npm install --global git-open
```