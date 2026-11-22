#!/bin/bash
# Comprueba si una web responde y con qué código HTTP
url="$1"

if [ -z "$url" ]; then
    echo "Uso: $0 URL" >&2
    exit 2
fi

codigo=$(curl -sL -o /dev/null -w "%{http_code}" "$url")
echo "Web: $url"
echo "Código HTTP: $codigo"
echo "Fecha: $(date '+%d/%m/%Y %H:%M')"
echo "Tiempo: $(curl -sL -o /dev/null -w "%{time_total}" "$url") s"
echo "IP: $(curl -sL -o /devv/null -w "%{remote_ip}" "$url")"

if [ "$codigo" -ge 200 ] && [ "$codigo" -lt 400 ]; then
    echo "Resultado: OK"
else
    echo "Resultado: FALLO"
    exit 1
fi
