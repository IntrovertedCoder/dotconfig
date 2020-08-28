function fish_greeting
    clear
end

# Custom Aliases
function ..
    c ..
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
    cd -- $argv
end
function cd
    builtin cd $argv
    ls
end

# Faster hard drive navigation
function A:
    cd /mnt/a
end
function C:
    cd /mnt/c
end
function D:
    cd /mnt/d
end

# Flash drive support
function E:
    cd /mnt/e
end
function mntE
    mkdir /mnt/e
    sudo mount -t drvfs e: /mnt/e
    cd /mnt/e
end
function umntE
    sudo umount /mnt/e
    sudo rm -r /mnt/e
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
function %appdata%
    cd /mnt/c/users/natro/AppData/Roaming
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
