class_name Bullet extends ABullet

func on_physics_process(delta:float) -> void:
	pass

func on_asteroid_collision(asteroid : A_Asteroid):
	queue_free()
	pass
