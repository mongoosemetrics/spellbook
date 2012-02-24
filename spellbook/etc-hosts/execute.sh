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
        echo "Usage: "
        echo "    spellbook etc-hosts [add|remove] [hostname] [ip]"
        echo 
        echo "The 'ip' option defaults to 127.0.0.1 if not provided."
        echo
        echo "Examples:"
        echo "    spellbook etc-hosts add testing.com"
        echo "    spellbook etc-hosts remove testing.com 192.168.1.1"
        exit 1
    ;;
esac
