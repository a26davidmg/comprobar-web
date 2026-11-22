#!/bin/bash
# Comprueba si una web responde y con qué código HTTP
url="$1"
codigo=$(curl -sL -o /dev/null -w "%{http_code}" "$url")
echo "Web: $url"
echo "Código HTTP: $codigo"
echo "Fecha: $(date '+%d/%m/%Y %H:%M')"
echo "IP: $(curl -sL -o /devv/null -w "%{remote_ip}" "$url")"