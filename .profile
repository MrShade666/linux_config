# ~/.profile: executed by Bourne-compatible login shells.

export PATH=/usr/sbin/:$PATH

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true

# Load the shell dotfiles, and then some:
for file in ~/.{aliases,bash_prompt,bash_sources,exports,functions,profile_local}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file
