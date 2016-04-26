#!/bin/sh
clear
echo Starting
echo PATH="$PATH"
WORKING_HOME="$(cd "$(dirname "$0")"/../; pwd)"
PID_FILE="$WORKING_HOME/firstapp.pid"
echo WORKING_HOME=$WORKING_HOME
echo "***********"
PWD=`pwd`
echo PWD=$PWD
echo "***********"
CMD="java -Xms512M -Xmx512M -XX:PermSize=64M -XX:MaxPermSize=128M -XX:+UseConcMarkSweepGC -XX:+UseCMSCompactAtFullCollection -XX:CMSInitiatingOccupancyFraction=70 -XX:+CMSParallelRemarkEnabled -XX:SoftRefLRUPolicyMSPerMB=0 -XX:+CMSClassUnloadingEnabled -XX:SurvivorRatio=8 -XX:+DisableExplicitGC -XX:-OmitStackTraceInFastThrow -Djava.net.preferIPv4Stack=true -jar *.jar"
echo CMD=$CMD
$CMD
echo $!>$PID_FILE
echo "***********"
echo process id [`cat $PID_FILE`]
#stty echo