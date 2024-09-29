/// @description Inicialización del enemigo
move_spd = 2;  // Velocidad de movimiento del enemigo
dir = choose(-1, 1);  // Dirección inicial aleatoria (-1 para izquierda, 1 para derecha)
moving = true;  // El enemigo empieza moviéndose
time_to_stop = irandom_range(60, 180);  // Tiempo aleatorio para detenerse
stand_timer = 0;  // Temporizador para la animación de pararse
facing_right = (dir == 1);  // Dirección inicial que mira el enemigo
