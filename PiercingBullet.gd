class_name PiercingBullet extends ABullet

@export var piercing : int = 3

func on_physics_process(delta:float) -> void:
	pass

func on_asteroid_collision(asteroid : A_Asteroid):
	piercing -= 1
	var dir_change = (global_position - asteroid.global_position).normalized()
	linear_velocity *= -1
	linear_velocity += dir_change * linear_velocity.length() 
	if piercing == 0: queue_free()
	pass
