extends A_Asteroid

var health : int = 10

func on_Dmg_Tkn() -> void:
	health -=1
	if (health <= 0) : queue_free();
	pass
