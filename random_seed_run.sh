# awk -v min=5 -v max=10 'BEGIN{srand(); print int(min+rand()*(max-min+1))}' | NS_GLOBAL_VALUE="RngRun=$(</dev/stdin)" CXXFLAGS="-Wno-error -Wno-unused-variable" ./waf --run "scratch/wifi-tcp --tcpVariant=TcpBic --payloadSize=1500 --simulationTime=5" | tail -301 | grep -P '(?<=: \t)(.*)(?= Mbit\/s)' -o
awk -v min=5 -v max=10 'BEGIN{srand(); print int(min+rand()*(max-min+1))}' | NS_GLOBAL_VALUE="RngRun=$(</dev/stdin)" CXXFLAGS="-Wno-error -Wno-unused-variable" ./waf --run "scratch/wifi-tcp --payloadSize=1500 --simulationTime=5" | tail -301 | grep -P '(?<=: \t)(.*)(?= Mbit\/s)' -o