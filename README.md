# README

Instalacion para Ubuntu

Instalar RVM con los siguientes comando desde una terminal:
- sudo apt-get install software-properties-common
- sudo apt-add-repository -y ppa:rael-gc/rvm
- sudo apt-get update
- sudo apt-get install rvm
- sudo usermod -a -G rvm $USER

Ahora hay que configurar la terminal para siempre cargar el rvm:
- Abre una terminal
- Abre las opciones y selecciona la opcion 'Preferences'
- Has click en el perfil Unnamed
- Selecciona la pestaña de command
- Asegurate que la opcion 'Run command as login shell' este seleccionada

Otra opcion para siempre cargar el rvm:
- ejecuta la siguiente linea de comando
- echo 'source "/etc/profile.d/rvm.sh"' >> ~/.bashrc

Ahora es necesario reiniciar la computadora

Istalar la version de ruby correta (3.3.1)
Ejecuta la siguiente linea de comando en una terminal
- rvm install 3.3.1

Para verificar que se instalo correctamente
- rvm ls
Asegurate que se usa la version 3.3.1 de ruby con el comando anterior o bien con el siguiente comando
- ruby --version

A instalar PostgreSQL, para eso ejecuta
- apt install postgresql
Si tienes algun problema relacionado con PostgreSQL puedes ver la paguina oficial
https://www.postgresql.org/download/linux/ubuntu/

Agregando usuario y agregando contraseña a las variables de entorno del sistema
En una termina ejecuta
- sudo -u postgres psql
- CREATE USER cargo_pizza WITH PASSWORD 'tu_contraseña' CREATEDB;

Para el poryecto es importante que el usuario se llame cargo_pizza
Ahora es a agrear la contraseña a las variables de entorno
- nano ~/.bashrc
En nano agregar la siguiente linea al final
- export cargo_pizza_DATABASE_PASSWORD="123456"
Luego hay que guardar el archivo, con nano es de la siguiente manera
Combinacion de teclado Ctrl + x
Luego apregar la tecla 'Y'
Y por ultimo apretar enter

Ahora es necesario instalar rails con el siguiente comando
- gem install rails

Se requiere instalar la gema de de PostgreSQL
- gem install pg

Entra a la carpeta del proyecto y ejecuta
- bundle install

Ahora hay que crear la base de datos y migraciones
- rails db:create db:migrate

El proyecto tiene datos listos para cargar en la base de datos, para ello es necesario ejecutar
- rails db:seed

Si deseas eliminar la base de dato puedes ejecutar
- rails db:drop

# Importante Permisos!

Hay dos tipos de empleados, Normal y Jefe

Si no se ha iniciado seccion, solo se tengra acceso al inicio y al informe de venta por cliente

Los normales tienen todos los permisos para las Ordenes y los Clientes.
Solo pueden leer los productos, ya sea otros, pizza tamaño, Sabores o bordes.

Los jefes tienen todos los permisos para los productos, ya sea otros, pizza tamaño, Sabores o bordes.
