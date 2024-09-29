/// @description Movimiento y animación de caminar
// Llamamos la función y asignamos las teclas para dirección
right_key = keyboard_check(vk_right);  // Verifica si la tecla derecha está presionada
left_key = keyboard_check(vk_left);    // Verifica si la tecla izquierda está presionada
jump_key = keyboard_check_pressed(vk_space);  // Verifica si se presiona la barra espaciadora para saltar

// Calculamos la velocidad de movimiento en el eje X
xspd = (right_key - left_key) * move_spd;

// Cambiar la dirección del personaje en el eje X y el sprite correspondiente
if xspd > 0 {
    face = RIGHT;  // El personaje mira a la derecha
    sprite_index = spr_rwalk;  // Cambia al sprite de caminar a la derecha
} else if xspd < 0 {
    face = LEFT;   // El personaje mira a la izquierda
    sprite_index = spr_lwalk;  // Cambia al sprite de caminar a la izquierda
} else {
    // Si el jugador no se está moviendo, cambiar al sprite de parado según la dirección
    if face == RIGHT {
        sprite_index = spr_ridle;
    } else {
        sprite_index = spr_lidle;
    }
}

// Saltar si está en el suelo y se presiona la barra espaciadora
if jump_key && on_ground {
    vspd = jump_spd;  // Aplicar velocidad de salto
    on_ground = false;  // El personaje ya no está en el suelo
    audio_play_sound(snd_jump, 1, false);  // Reproducir el sonido del salto
}

// Aplicar gravedad solo si no está en el suelo
if !on_ground {
    vspd += gravity;
}

// Control de colisiones verticales (con obj_floor para detectar si está en el suelo)
if place_meeting(x, y + vspd, obj_floor) {
    while !place_meeting(x, y + sign(vspd), obj_floor) {
        y += sign(vspd);  // Ajustamos la posición al suelo
    }
    vspd = 0;
    on_ground = true;  // El personaje está en el suelo
} else {
    on_ground = false;  // El personaje está en el aire
}

// Mover al personaje en el eje Y (gravedad y salto)
y += vspd;

// Colisión horizontal (evitar que atraviese paredes)
var _subPixel = 0.5;
if place_meeting(x + xspd, y, obj_wall) {
    // Deslizar la pared con precisión
    var _pixelCheck = _subPixel * sign(xspd);
    while !place_meeting(x + _pixelCheck, y, obj_wall) {
        x += _pixelCheck;
    }
    // Establecemos xspd a 0 al colisionar
    xspd = 0;
}

// Movimiento en el eje X
x += xspd;