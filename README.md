# PONG

Autor: Pablo Morales Gómez

Asignatura: Creando Interfaces de Usuario

Curso: 4º



## Introduccion

Esta práctica sirve comoo toma de contacto con la herramienta Processing. El objeto de la misma era simular el clásico videojuego PONG. Un juego pensado para dos jugadores que imita un partido de un deporte jugado con raqueta. Cada jugador controla uno de los rectángulos que se encuentran a los lados derecho e izquierdo de la pantalla. Estos solo se podrán desplazar sobre su eje vertical. 

Se logrará un punto cuando uno de ellos logre colar la pelota (el tercer elemento integrante en este juego) por detrás de uno de los jugadores. El partido concluirá cuando uno de los jugadores alcance 7 puntos. La trayectoria que seguirá la bola va a estar condicionada por la forma en la que sea golpeada por los jugadores.



## Desarrollo

Para este proyecto hemos creado diferentes objetos que representan los componentes, es decir, hay un objeto *Ball*, dos *Player* y un *Playfield*. Además se ha decidido, por conveniencia a la hora de realizar modificaciones, crear una clase encargada puramente de las colisiones que recibe el nombre de *Collitions*. Tendrá acceso al resto de objetos para así poder trabajar con sus posiciones y sus correspondientes velocidades de movimiento con comodidad.


### Campo

La clase campo se encarga de dibujar las diferentes pantallas que se muestran durante la ejecución de la aplicación, para discernir que pantalla mostrar usamos una variable global que se llama *gameMode*. El *gameMode* inicial es 0, en este estado el juego mostrará un rectámgulo gris con un poco de transparencia superpuesto al campo de juego, bola y jugadores. En este rectángulo aparecerán los controles y las normas del juego en un tono rojo y con una letra legible. Esta pantalla, además se usa como pantalla de pausa (que el jugador podrá activar pulsando la tecla *H* cuando este jugando. Cuando el jugador decida pulsar la tecla *ENTER* el *gameMode* cambiará a 1.

El *gameMode* 1 es el modo de juego. En este estado los jugadores podrán mover las palas y la pelota irá rebotando por la pantalla. Podremos ver una línea de rectángulos que separa el campo de juego en 2, a los jugadores y la bola. Por otro lado, en cada cancha habrá un marcador que llevará la punttuación hasta el momento de los jugadores. Finalemnte podemos ver un mensaje recordatorio en un extremo de la pantalla que nos recuerda que podemos pausar la partida pulsando la tecla *H*.

En último lugar tenemos el *gameMode* 2, este simplemente sirve para mostrar un mensaje de felicitación al jugador vencedor y para ofrecer a los usuarios la posibilidad de comenzar una nueva partida (evitando de esta forma que los clientes tengan que cerrar y abrir la aplicación si desean jugar otra ronda).


### Jugadores

Aparecen representados como dos rectángulos blancos que se encontran a los lados izquierdo y derecho del campo. Cada jugador tiene sus propios controles. El izquierdo se mueve hacia arriba y hacia abajo con las letras *W* y *S* y el derecho lo hace con *U* y *J*. La velocidad a la que se mueven es estable y no se modifica durante la partida.  Como el set de posibles movimientos para un jugador era tan limitado y pensábamos que podría ser poco entretenido para los jugadores en el tiempo, se decidió añadir un poco de "complejidad" a la pala.

Dependiendo de con que zona golpees la pelota, la velocidad en el eje x (nos referimos con velocidad a la cantidad de puntos que se desplaza en cada frame) variará, siendo mayor si se golpea con el centro y menor a medida que nos aproximamos a los bordes. Para esto usamos las coordenadas de la pala para dividirla  en 5 zonas distintas. La velocidad que se imprime en el eje y depende también de con que zona de la raqueta se golpee siendo mayor cuanto más cerca estes de los bordes. En este caso decidimos que solo se imprimiría velocidad en la componente y si cuando se golpeaba el balón se estaba pulsando una tecla, con esto conseguimos la sensación de aplicar un efecto a la bola lo que hace el juego más vistoso y entretenido. En el caso de que se golpee y no se esté moviendo eljugador la velocidad en el eje vertical se irá reduciendo poco a poco hasta llegar a cero. Cabe destacar que el sentido de la velocidad en este último eje dependerá de si nos estamos moviendo hacia abajo (teclas "S" o "J") o hacia arriba (teclas "W" o "U").


### Pelota

La pelota está representada por un círculo negro con un grueso borde blanco. Esta se moverá en 2D con una velocidad dependiente a la forma en la que la hayan golpeado. Al comienzo de la partida se moverá de forma aleatoria hacia uno de los dos jugadores. A partir del primer gol el jugador que sacará será aquel al que han marcado el punto. Lo hemos hecho de esta manera puesto que pensamos que es la forma habitual de realizarlo y porque de esta forma el jugador que ahora se encuentra en desventaja goza de una pequeña ventaja (el saque) que le puede ayudar a igualar el marcador y hacer el partido más interesante.


### Sonido 

Se ha decidido incluir 3 sonidos diferentes para facilitar al usuario el reconocimiento de determinadas situaciones y su diferenciación. Son los siguientes: un sonido para cuando se produce un rebote en un borde del campo de juego, uno para cuando el jugador lográ golpear la pelota con la pala y uno para indicar que se ha marcado un gol (este último sirve de refuerzo al marcador).




Las herramientas y referencias utilizadas fueron las propuestas por el guión de prácticas, además del propio guión de prácticas. Algunos de los sonidos fueron descargados ded la página freeSound
