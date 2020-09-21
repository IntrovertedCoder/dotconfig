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

# Light commands
function on
    sudo python3.5 ~/light_test.py 178 3
end
function off
    sudo python3.5 ~/light_test.py 0 1
    sudo python3.5 ~/light_test.py 0 1
end
