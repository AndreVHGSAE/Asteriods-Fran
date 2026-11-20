@abstract class_name APowerUp extends RigidBody2D

@export_range(100, 1000, 10) var speed:float = 250

var on_grab : Signal

func _init() -> void:
	body_entered.connect(handle_grab)
	
	linear_velocity = Vector2.UP.rotated(randf() * 2 + PI) * speed
	angular_velocity = randf_range(-1,1) * PI / 2
	
	init()
	pass

@abstract func init() -> void

func handle_grab(other : CollisionObject2D) -> void:
	if !(other is Ship) : return
	print_debug("AAAAA")
	activate()
	on_grab.emit(other as Ship)
	GameManager.me.remove_child(self)
	pass

@abstract func activate() -> void
