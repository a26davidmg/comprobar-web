#!/bin/bash
# Comprueba si una web responde y con qué código HTTP
url="$1"
codigo=$(curl -sL -o /dev/null -w "%{http_code}" "$url")
echo "Web: $url"
echo "Código HTTP: $codigo"