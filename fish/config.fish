function fish_greeting
    if test -n "$SSH_TTY"  # Tell if running on ssh
    else if test "$USER" = 'root'  # Or if root
    else  # If neither then clear
        clear
    end

    # Start ssh-agent on startup
    # Note this doesn't add identity files
    if ps -p $SSH_AGENT_PID > /dev/null
        set sshagent "SET"
    else
        ssh-agent /usr/bin/fish
    end

    # Set EDITOR/VISUAL to vim
    set -Ux EDITOR vim
    set -Ux VISUAL vim

    # Custom keybinds {{{
        # Bind F2 to insert sudo to beginning of line
        bind -k f2 __fish_prepend_sudo

        # Bind F3 to open command in EDITOR/VISUAL
        bind -k f3 edit_command_buffer
    # }}}

    # Pull updated dot config files from github
    set cwd $PWD
    cd ~/.config/dots > /dev/null
    git pull https://github.com/IntrovertedCoder/dotconfig --quiet&
    cd $cwd > /dev/null
end

# Custom Aliases
function ..
    cd ..
end
function v
    vim .
end
function update
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get autoremove
end
function ll
    # a: all files/dirs except . and ..
    # l: show each file/dir as line and show more info
    # h: Adds a header to each row
    # g: shows groups the file belongs to (Yellow if user is in group and white if not)
    # --icons: show file icon (requires nerdfont)
    # --git: show git status
    # --octal-permissions: show permissions (same as chmod)
    exa -alhg --icons --git --octal-permissions $argv
end
function ls
    # a: all files/dirs except . and ..
    # x: sort horizontally instead of vertically
    exa -ax --icons --git $argv
end
function tree
    # a: all files/dirs except . and ..
    # icons: show icons from NerdFonts
    # tree: same as tree command
    # level: how many folders to go into
    # F: show if the file is executable with a * at the end of the file
    # I: folders to ignore
    # color: show color in less
    exa -a --icons --tree --level=3 -F -I='.git' --color=always $argv | less -r +G
end
function mkcd
    mkdir -- $argv
    if [ $status = '0' ]
        cd -- $argv
    end
end
function cd
    set cwd $PWD
    builtin cd $argv
    if [ $PWD != $cwd ]
        exa -ax --icons --git
    end
end
function e
    if count $argv > /dev/null
        if test -e $argv
            explorer.exe $argv
        else
            echo "Please select a folder in the current working directory"
        end
    else
        explorer.exe .
    end
end
function c
    rm a.out
    gcc $argv
    ./a.out
end

# File scanning
function finds
    if count $argv > /dev/null
        if test -e ~/files
            grep -i $argv ~/files
        end
    end
end
function findc
    if count $argv > /dev/null
        grep $PWD ~/files | grep -i $argv
    end
end
