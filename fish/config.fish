function fish_greeting
    clear
end

# Custom Aliases
function ..
    cd ..
end
function v
    vim .
end
function update
    sudo pacman -Syu
    betterdiscordctl update
end
function ll
    ls -alFh
end
function la
    ls -A
end
function l
    ls -CF
end
function g
    googler --count 4 -- $argv
end
function mkdir
    command mkdir -- $argv
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
            thunar $argv
        else
            echo "Please select a folder in the current working directory"
        end
    else
        thunar .
    end
end
function c
    rm a.out
    gcc $argv
    ./a.out
end

# Faster hard drive navigation
function A:
    cd /run/media/arik/Storage
end
function C:
    cd /run/media/arik/74B89EF7B89EB758
end
function D:
    cd /run/media/arik/Random\ stuff/
end

# Common folders
function research
    cd /mnt/a/Research\ Lab
end
function projects
    set dir $PWD
    builtin cd /mnt/a/projects
    vim /mnt/a/projects/projects
    builtin cd $dir
end

# Microsoft Office Suite
function pptx
    /mnt/c/Program\ Files\ \(x86\)/Microsoft\ Office/root/Office16/POWERPNT.EXE &
end
function word
    /mnt/c/Program\ Files\ \(x86\)/Microsoft\ Office/root/Office16/WINWORD.EXE &
end
function excel
    /mnt/c/Program\ Files\ \(x86\)/Microsoft\ Office/root/Office16/EXCEL.EXE &
end

# Python custom commands
function python
    cd /mnt/a/Coding/Python
end
function 3.8
    cd /mnt/a/Coding/Python/3.8
end
function 3.7
    cd /mnt/a/Coding/Python/3.7
end
function 3.6
    cd /mnt/a/Coding/Python/3.6
end
function 3.5
    cd /mnt/a/Coding/Python/3.5
end
