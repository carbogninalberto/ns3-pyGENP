#./waf --run "scratch/wifi-tcp --tcpVariant=TcpBic --payloadSize=250 --simulationTime=30"
# awk -v min=1 -v max=42 'BEGIN{srand(); print int(min+rand()*(max-min+1))}' | NS_GLOBAL_VALUE="RngRun=$(</dev/stdin)" 
# awk -v min=5 -v max=10 'BEGIN{srand(); print int(min+rand()*(max-min+1))}' | NS_GLOBAL_VALUE="RngRun=$(</dev/stdin)" CXXFLAGS="-Wno-error -Wno-unused-variable" ./waf --run "scratch/wifi-tcp --tcpVariant=TcpBic --payloadSize=1500 --simulationTime=5" | tail -301 | grep -P '(?<=: \t)(.*)(?= Mbit\/s)' -o
TCP_VARIANT="${1:-TcpNewReno}"
SECONDS="${2:-5}"
SEED="${3-42}"
PAYLOAD_SIZE="${4-1500}"
#echo "TCP_VARIANT $TCP_VARIANT"
NS_GLOBAL_VALUE="RngRun=$SEED" CXXFLAGS="-Wno-error -Wno-unused-variable" ./waf --run "scratch/wifi-tcp --tcpVariant=$TCP_VARIANT --payloadSize=$PAYLOAD_SIZE --simulationTime=$SECONDS" | tail -$(($SECONDS*10)) | grep -P '(?<=: \t)(.*)(?= Mbit\/s)' -o