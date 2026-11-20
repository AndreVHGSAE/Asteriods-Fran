class_name PiercingBulletPU extends APowerUp

@export var Piercing_bullet_scene : PackedScene

func init() -> void:
	pass



func activate() -> void:
	GameManager.continious_actions.connect(replace_bullet_for_piercing)
	GameManager.delay_action(stop,5)
	pass

func replace_bullet_for_piercing() -> void:
	for child in GameManager.me.get_children():
		if !(child is ABullet) || child is PiercingBullet: continue
		var other = child as ABullet
		var NewPBullet = Piercing_bullet_scene.instantiate() as PiercingBullet
		GameManager.me.add_child(NewPBullet)
		NewPBullet.shoot(other.linear_velocity)
		other.queue_free()
	pass
	
func stop() -> void:
	GameManager.continious_actions.disconnect(replace_bullet_for_piercing)
	queue_free()
