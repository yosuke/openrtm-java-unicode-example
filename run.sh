#!/bin/sh

echo "exiting existing components..."
rtexit /localhost/ConsoleIn0.rtc
rtexit /localhost/ConsoleOut0.rtc
sleep 3

echo "launching components..."
gnome-terminal -x java -classpath .:../OpenRTM-aist/1.0/jar/OpenRTM-aist-1.0.0.jar:../OpenRTM-aist/1.0/jar/commons-cli-1.1.jar SimpleIO.ConsoleInComp -f SimpleIO/rtc.conf
gnome-terminal -x java -classpath .:../OpenRTM-aist/1.0/jar/OpenRTM-aist-1.0.0.jar:../OpenRTM-aist/1.0/jar/commons-cli-1.1.jar SimpleIO.ConsoleOutComp -f SimpleIO/rtc.conf
sleep 3

echo "connecting components..."
rtcon /localhost/ConsoleIn0.rtc:out /localhost/ConsoleOut0.rtc:in

sleep 1

echo "activating components..."
rtact /localhost/ConsoleIn0.rtc
rtact /localhost/ConsoleOut0.rtc

echo "now type in some texts (if you finished > press enter)"
read dummy

echo "exiting components..."
rtexit /localhost/ConsoleIn0.rtc
rtexit /localhost/ConsoleOut0.rtc
