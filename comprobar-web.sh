#!/bin/bash
# Comprueba si una web responde y con qué código HTTP
if [ -z "$1" ]; then
    echo "Uso: $0 <url>" >&2
    exit 2
fi

url="$1"
read -r codigo tiempo ip < <(curl -sL -o /dev/null --connect-timeout 5 -m 15 \
-w "%{http_code} %{time_total} %{remote_ip}" "$url")
echo "Web: $url"
echo "Fecha: $(date '+%d/%m/%Y %H:%M')"

if [ "$codigo" = "000" ]; then
    echo "Resultado: FALLO (no se pudo conectar)"
    exit 1
fi

echo "Código HTTP: $codigo"
echo "Tiempo: $tiempo s"
echo "IP: $ip"

if [ "$codigo" -lt 400 ]; then
    echo "Resultado: OK"
else
    echo "Resultado: FALLO"
    exit 1
fi
