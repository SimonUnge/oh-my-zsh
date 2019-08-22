rt() {
    if [ $# -eq 0 ]; then
        cd ~/work/rt
    else
        local dir=~/work/rt/${1}
        if [ ! -d ${dir} ]; then
            mkdir ${dir}
            cp -r ~/work/clean_confd/* ${dir}
        else
            echo "RT directory ${1} already existing, just going there..."
        fi
        cd ${dir}
        (get_attachments ${1} &) &> /dev/null
    fi
}

rtn() {
    if [ $# -eq 0 ]; then
        cd ~/work/rt
    else
        local dir=~/work/rt/${1}
        if [ ! -d ${dir} ]; then
            mkdir ${dir}
            cp -r ~/work/clean_ncs/* ${dir}
        else
            echo "RT directory ${1} already existing, just going there..."
        fi
        cd ${dir}
        (get_attachments ${1} &) &> /dev/null
    fi
}

yang() {
    local name="$(shuf -n 1 ~/work/scripts/yangvillainnames).yang"
    if [ -e "./${name}" ]; then
        yang
    else
        emacsclient -n $name
    fi
}

nsos () {
    ls -l ~/work/releases
}

ns () {
    source ~/work/releases/nso-${1}/ncsrc
}
