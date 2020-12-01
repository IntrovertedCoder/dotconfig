function fish_greeting
    if test -n "$SSH_TTY"  # Tell if running on ssh
    else if test "$USER" = 'root'  # Or if root
    else  # If neither then clear
        clear
    end
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
    ls -alFh
end
function lt
    ls -hs1Sc
end
function la
    ls -A
end
function l
    ls -CF
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
        ls -Ahs
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
