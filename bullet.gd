class_name Bullet extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	var colliders = get_colliding_bodies()
	for obj in colliders:
		if !(obj is Asteroid): continue
		(obj as Asteroid)._take_dmg()
		
	pass
