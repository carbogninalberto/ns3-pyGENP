#!/bin/bash
#CXXFLAGS="-Wno-error -Wno-unused-variable" ./waf configure --disable-python
# CXXFLAGS="-Wno-error -Wno-unused-variable" ./waf --run "scratch/wifi-tcp --payloadSize=1500 --simulationTime=2" | tail -20 | grep -P '(?<=: \t)(.*)(?= Mbit\/s)' -o
CXXFLAGS="-Wno-error -Wno-unused-variable" ./waf --run "scratch/wifi-tcp --tcpVariant=TcpBic --payloadSize=1500 --simulationTime=2" | tail -20 | grep -P '(?<=: \t)(.*)(?= Mbit\/s)' -o


