#!/usr/bin/env sh

# Install command-line tools using Homebrew.

######## homebrew ##########
# Check if installed
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Ensure Homebrew is added to PATH for this session
  export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"
else
  echo "Homebrew is already installed."
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)
######## ########

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
s
brew install zsh

## Install a modern version of Bash.
#brew install bash
#brew install bash-completion2
#
## Switch to using brew-installed bash as default shell
#if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
#  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
#  chsh -s "${BREW_PREFIX}/bin/bash";
#fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs  # Git Large File Storage
brew install git-gui  # gitk for pretty logs
brew install gs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

# qedpi apps
brew install --cask google-chrome
brew install --cask google-drive
brew install --cask slack
brew install --cask zoom
brew install --cask linear-linear  # project management
brew install --cask jetbrains-toolbox
brew install --cask github
#brew install --cask figma
#brew install --cask 1password
brew install --cask anki
brew install --cask flux  # screen color adjustment

# qedpi productivity
brew tap espanso/espanso && brew install espanso  # text expander
brew install --cask karabiner-elements  # keyboard remapping
brew install --cask talon  # voice coding

# font design
#brew install fontforge

# automations
brew install mas  # Mac App Store CLI

# TODO move elsewhere, also need to sign in to app store beforehand
if command -v mas >/dev/null 2>&1; then
  mas install 497799835  # Xcode
  # open "macappstore://itunes.apple.com/app/id497799835"  # use this if mas fails
fi

# dev
brew install jq  # command-line JSON processor
#brew install cookiecutter  # A command-line utility that creates projects from cookiecutters (project templates).
#docker
#docker-compose
brew install --cask orbstack  # docker desktop light
#fd # @todo consider vs gnu find
#ffmpeg
#gh # GitHub CLI
ghostscript  # PostScript and PDF interpreter
#icu4c@75
## python
brew install poetry  # Python dependency management and packaging tool
brew install uv  # fast Python package installer and resolver in Rust
#brew install virtualenv  # Python virtual environment builder
#brew install pyenv  # Python version management
#brew install pipx  # install and run Python applications in isolated environments
brew install python@3.12  # more support than 3.13

# JS/TS
brew install nvm # Node Version Manager, includes npm
nvm install node  # latest node
#nvm --version
#node --version
#npm --version
brew install pnpm
#pnpm --version
#brew install oven-sh/bun/bun  # modern build tool
#brew install yarn
#brew install vercel-cli	# Vercel CLI

# other langs
brew install rust

# AI
brew install ollama  # local llm server

# tools
brew install --cask jetbrains-toolbox	 # JetBrains IDEs
#brew install tesseract  # OCR
#brew install biome # manage & deploy Rust WebAssembly packages
#brew install libmagic	# File type identification library
#brew install withgraphite/tap/graphite  # stacked commits

# infra
#brew install redis
#brew install supabase/tap/supabase
#brew install awscli
#brew tap heroku/brew && brew install heroku


#portaudio  # cross-platform library for audio I/O

#sevenzip  # file archiver with a high compression ratio, alt: Keka
#tcl-tk  # Tool Command Language and Toolkit
#wimlib  # Windows Imaging Format (WIM) library


# Remove outdated versions from the cellar.
brew cleanup
