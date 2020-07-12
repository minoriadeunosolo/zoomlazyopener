#!/bin/bash
# Zoom Lazy Opener

zoom_room=$(tr '[:upper:]' '[:lower:]' <<<"$1")
case $zoom_room in
daily|tanya)
         confno="111111"
         pwd="2222"
         ;;
coffe|weekly)
         confno="333333"
         pwd="33333"
         ;;
team|group)
        confno="4444444"
        pwd=""
        ;;
batiato) confno="5555555"
         pwd=""
         ;;
*) confno=""
   pwd=""
   ;;
esac

echo "$zoom_room CONF: $confno PWD: $pwd"

if [ "$confno" != "" ]; then
    if [ "$pwd" == "" ]; then
        url="zoommtg://zoom.us/join?action=join&confno=$confno"
    else
        url="zoommtg://zoom.us/join?action=join&confno=$confno&pwd=$pwd"
    fi

    case "$OSTYPE" in
          solaris*) echo "SOLARIS" ;;
          darwin*)  open "$url" ;;
          linux*)   xdg-open ;;
          bsd*)     echo "BSD" ;;
          msys*)    echo "WINDOWS" ;;
          *)        echo "unknown: $OSTYPE" ;;
esac
    open "$url"
else
    echo "NO ZOOM id "
fi
