# Munin y jMeter #

Este proyecto busca probar munin y jmeter en un ambiente *dockerizado*, para hacer uso de las carasteristicas de monitorizacion de munin y la automatizacion de peticiones con jMeter, gracias a lo anterior podemos establecer conclusiones sobre el rendimiento maximo que puede mantener el servidor.

## Arquitectura ##

La arquitectura de implementacion es dependiente de la arquitectura requerida por *munin* la cual consta de los siguientes elementos:

![alt-text](http://guide.munin-monitoring.org/en/latest/_images/Munin-Architecture.png)

- **nodo-master:** permite monitorear los nodos esclavos.
- **nodo-esclavo:** es un host el cual ejecuta x o y actividad o tarea.

Para mas información se puede consultar [aquí](http://guide.munin-monitoring.org/en/latest/architecture/index.html)

Por ende nuestra arquitectura constará de **2 dockers**, para impedir la instalación del nodo master en el equipo anfitrion, evitando la configuracion inusual especificada en la documentacion.

![alt-text](/imgs/msg.png)

## Pruebas con jmeter ##

Despues de haber creado los contenedores y configurado estos, con los pasos descritos [aquí](/Docker/README.md) y [aquí](/Ansible/README.md), procederemos a realizar las pruebas hacia la app con jmeter, para esto lo instalaremos en nuestro equipo localmente, **requiere java v. 8** que se puede encontrar [aquí](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html).

Por ultimo despues de instalado java, se procede a descargar **jmeter** en este [enlace](http://jmeter.apache.org/download_jmeter.cgi), podremos apreciar algo parecido a lo siguientes

![alt-text](/imgs/jdw.png)

Proceden a descargar alguno de los archivos *source* y al terminar extraen su contenido (sea con winrar o 7zip), y acceden a la carpeta, se lograga apreciar los siguientes directorios

![alt-text](/imgs/jdir.png)

Se accede al directorio bin y se ejecuta el archiv **jmeter.bat** y se logrará apreciar la interfaz inicial de jmeter

![alt-text](/imgs/jscr.png)

De manera directa y breve para crear un plan para la prueba de web se requiere añadir 3 configuraciones al plan de prueba existente o se crea uno nuevo

**Configuracion de usuarios (Grupo de hilos)**

Lo anterior permite configurar la cantidad de hilos, usuarios y la cantidad de veces que se repetira el proceso (peticiones) establecidas, para lo anterior basta con *crear un Grupo de hilos a nuestro plan de prueba*, de la siguiente forma

![alt-text](/imgs/jgt.png)

donde aparecerá la ventana de configuracion de variables siguiente

![alt-text](/imgs/jgt1.png)

Donde

1. Se establecen la cantidad de usuarios (hilos).
2. Se establecen la cantidad de peticiones a realizar (periodo de subida).
3. Se establece la cantidad de veces que se realizará el proceso descrito en los 2 campos anteriores.

En nuestro caso se configura para que 100 usuarios, realicen 2 peticiones 3 veces.

Y asi se completa este paso.

**Configuración de peticion http por defecto**

Para lo anterior se agrega al grupo de hilos las peticiones por defecto (HTTP Request default), de la siguiente forma

![alt-text](/imgs/jhdc.png)

Al realizar lo anterior se observan las opciones de configuración

![alt-text](/imgs/jhdc1.png)

Donde

1. Se establece el protocolo del servidor web.
2. Se establece la dirección ip del servidor web.
3. Se establece el puerto de conexión hacia el servidor web.

En mi caso no establezco parametros para la petición, pero en caso de establecerlo estos se añaden a todas las peticiones que se realizan al servidor web.

**Configuración de petición web**

Para este paso agregaremos la peticion a realizar, de la siguiente forma

![alt-text](/imgs/jcp.png)

Se observan las opciones de configuracion

![alt-text](/imgs/jcp1.png)

Donde

1. Se establece el metodo HTTP a utilizar.
2. Se establece la ruta del servidor a realizar la peticion.
3. Se establece la codificacion de la información.

En este caso se a realizara la paticion a la ruta raiz (index) de la pagina web.

**Graficador de resultados**

Por ultimo añadiremos un graficador de resultados para observar el comportamiento, de la siguiente forma

![alt-text](/imgs/jgr.png)

Lo que genera la siguiente vista

![alt-text](/imgs/jgr1.png)

Donde

1. Espacio de trabajo donde se logrará apreciar la grafica.

Al ejecutar el grupo de hilos (100 Hilos), presionando el boton play (verde sin simbolo).

Genera la siguiente salida.

![alt-text](/imgs/jgr2.png)

Donde

* **Datos**: muestra la fluctuación de los datos en la web, durante las peticiones.
* **Media**: Indica la media de los datos.
* **Mediana**: indica la mediana de los datos de la peticion.
* **Desviacion**: Indica la desviacion estandar de la media y mediana.
* **Rendimiento**: muestra el rendimiento del test.

Y asi se genera una prueba basica a una web con jmeter, para mas referencias observar.

1. http://jmeter.apache.org/usermanual/jmeter_distributed_testing_step_by_step.html
2. https://es.slideshare.net/bhojanrajan/performance-testing-jmeter
