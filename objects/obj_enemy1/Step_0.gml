/// @description Movimiento aleatorio del enemigo sin caerse de la plataforma

// Verificar si el enemigo está al borde de la plataforma
if !place_meeting(x + dir, y + 1, obj_floor) {
    dir = -dir;  // Cambia la dirección si llega al borde de la plataforma
    facing_right = (dir == 1);  // Actualizar la dirección en la que mira
}

// Movimiento del enemigo si está en modo de moverse
if moving {
    x += dir * move_spd;  // Mueve al enemigo en la dirección establecida

    // Cambia el sprite según la dirección del movimiento
    if dir == 1 {
        sprite_index = spr_pepejr_rwalk;  // Sprite de caminar a la derecha
    } else {
        sprite_index = spr_pepejr_lwalk;  // Sprite de caminar a la izquierda
    }
    
    // Decrementa el tiempo para detenerse
    time_to_stop--;
    
    // Si el tiempo llega a 0, el enemigo se detiene
    if time_to_stop <= 0 {
        moving = false;  // Cambia el estado a detenerse
        stand_timer = irandom_range(30, 90);  // Tiempo que el enemigo estará parado
        // Cambia el sprite a la posición de "stand" según la dirección
        if facing_right {
            sprite_index = spr_pepejr_rstand;  // Sprite parado mirando a la derecha
        } else {
            sprite_index = spr_pepejr_lstand;  // Sprite parado mirando a la izquierda
        }
    }
} else {
    // El enemigo está parado, cuenta el tiempo hasta que se vuelva a mover
    stand_timer--;

    // Si el tiempo para pararse termina, vuelve a moverse
    if stand_timer <= 0 {
        moving = true;
        time_to_stop = irandom_range(60, 180);  // Tiempo aleatorio hasta la próxima parada
        dir = choose(-1, 1);  // Cambia de dirección aleatoriamente
        facing_right = (dir == 1);  // Actualiza la dirección en la que mira
    }
}

// Verificar colisiones con paredes (obj_wall) para cambiar de dirección
if place_meeting(x + dir, y, obj_wall) {
    dir = -dir;  // Cambia la dirección si hay una colisión con una pared
    facing_right = (dir == 1);  // Actualiza la dirección en la que mira
}
