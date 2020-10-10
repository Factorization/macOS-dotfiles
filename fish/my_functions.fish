function up
    ping 8.8.8.8
end

alias rm "rm -i"

alias lc='colorls -lA --sd'

function battery
    pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto | cut -f1 -d';'
    pmset -g batt | egrep "([0-9]+\%).*" -o --colour=auto | cut -f3 -d';'
end

function cpu
    sysctl -n machdep.cpu.brand_string
end

function ip
    dig +short myip.opendns.com @resolver1.opendns.com
end

function ss
    open /System/Library/CoreServices/ScreenSaverEngine.app
end

function lock
    /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
end

function uptime
    command grc uptime
end

function df --description 'Displays disk free space'
    command df -H $argv
end

function vlc
    open -a vlc $argv
end

function fresh
    command git commit -m "empty commit" --allow-empty
end

function pyc
    command find . -name "*.pyc" -exec rm -rf {} \;
end

function cheat.sh
    curl cheat.sh/$argv
end
complete -c cheat.sh -xa '(curl -s cheat.sh/:list)'

function gi
	curl -sL https://www.toptal.com/developers/gitignore/api/$argv
end
complete -c gi -xa '(curl -s https://www.toptal.com/developers/gitignore/api/list | string split ,)'

function venv
    if ! test -d ~/.virtualenvs/(basename $PWD)
        vf new $argv (basename $PWD)
        if test $status -eq 0
            vf connect
            python3 -m pip install --upgrade pip setuptools
        end
    else
        vf activate (basename $PWD)
    end
end
