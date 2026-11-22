# comprobar-web
Script que comprueba si una web responde.
Uso: ./comprobar-web.sh URL
Requisitos: bash y curl.
Ejemplo: ./comprobar-web.sh https://example.com
Si no puede conectar con la web, el código HTTP es 000.
Códigos de salida: 0 si la web responde bien, 1 si falla y 2 si falta la URL.
