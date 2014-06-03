# Lourenzo's Mac OSX Shell Dot Files

This dotfiles will add a nice PS1 showing your git repository branch and alerting the repo status, and is quite handy to customize.

It also sets up [Homebrew](http://brew.sh)'s `bash-completion` and GNU Core Utils


##Checkout this repo at your `$HOME` folder
Using the following commands:
```bash
cd $HOME
git clone https://github.com/lourenzo/mac-dotfiles.git
```

## Add the initializer to your Bash profile


Then you can require the dotfiles in your profile:

```bash
cat $HOME/mac-dotfiles/sample.bash_profile >> ~/.profile
```

Or you can edit your `~/.profile` or `~/.bash_profile` adding the following line:

```bash
source $HOME/mac-dotfiles/init.bash
```

## Install Homebrew, GNU Core utils and bash-completion (Recommended)

### [Homebrew](http://brew.sh)
[Homebrew](http://brew.sh) is an excellent mac package manager, very useful for developers.
To install it, just run the following command:

```bash
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"
```

### Bash Completion

Having homebrew installed, just run the following command:

```bash
brew install bash-completion
```

### GNU Core Utils
If you are used with GNU commands, used in most GNU/Linux distros and slightly different from BSD core utils mainly in command syntax, you can install it using the following command:

```bash
brew install coreutils
```
