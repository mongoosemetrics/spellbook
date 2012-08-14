#! /bin/bash
DEFAULT_IP=127.0.0.1
IP=${3:-$DEFAULT_IP}

case "$1" in
    add)
        echo "$IP $2"  >> /etc/hosts
    ;;
    remove)
        sed -ie "\|^$IP $2\$|d" /etc/hosts
    ;;

    *)
        spellbook help etc-hosts
        exit 1
    ;;
esac
