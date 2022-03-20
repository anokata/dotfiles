#!/bin/bash
# filetype: sh
WSDL="http://10.4.126.20:8091/service_medic_mfc/mfc/mfc_service.wsdl"
ACTION="GetDictionary"
DATAFILE="/home/ksi/work/soap/getDictionary_catalog_request.xml"
OKRESPONSE="CatalogResponse"

WSDL="$1"
ACTION="$2"
DATAFILE="$3"
#OKRESPONSE="$4"

curl \
    --header "Content-Type: text/xml;charset=UTF-8" \
    --header "SOAPAction: $ACTION" \
    --data @$DATAFILE \
     $WSDL > /tmp/soap 2>&1

cat /tmp/soap | grep $OKRESPONSE > /dev/null
echo $?
#echo 0
#{Zabbix server:zabbixsoap.sh["http://10.4.126.20:8091/service_medic_mfc/mfc/mfc_service.wsdl","GetDictionary","/home/ksi/work/soap/getDictionary_catalog_request.xml"].str("0", #1)}=0

