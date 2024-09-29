/// @description Inicialización del jugador

// Definir constantes para las direcciones
RIGHT = 1;
LEFT = -1;

// Variables para la velocidad de movimiento y salto
move_spd = 4;       // Velocidad horizontal del jugador
jump_spd = -10;     // Fuerza del salto (negativa para moverse hacia arriba)
gravity = 0.5;      // Gravedad que afecta al jugador
vspd = 0;           // Velocidad vertical inicial (caída)

// Estado inicial del jugador
on_ground = false;  // El jugador no empieza en el suelo
face = RIGHT;       // El jugador comienza mirando a la derecha
