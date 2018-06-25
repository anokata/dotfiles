#!/bin/bash
# filetype: sh
WSDL="http://10.4.126.20:8091/service_medic_mfc/mfc/mfc_service.wsdl"
ACTION="GetDictionary"
DATAFILE="/home/ksi/work/soap/getDictionary_catalog_request.xml"

curl \
    --header "Content-Type: text/xml;charset=UTF-8" \
    --header "SOAPAction: $ACTION" \
    --data @$DATAFILE \
     $WSDL > /tmp/soap 2>&1

cat /tmp/soap | grep CatalogResponse > /dev/null
#echo $? > /tmp/soap_result
echo 0

