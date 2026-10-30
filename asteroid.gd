class_name Asteroid extends RigidBody2D

enum Size
{
	Big, Medium, Small
}

@export var size : Size = Size.Big

# Called when the node enters the scene tree for the first time.
func _validate_size() -> void:
	var set_scale = 0
	if size == Size.Medium: set_scale = 0.5
	else: set_scale = 0.3
	
	for child in get_children():
		(child as Node2D).global_scale *= set_scale
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _take_dmg() -> void:
	GameManager.score += 10
	if size == Size.Small:
		queue_free() #Destroys the object
		return
	
	var newAsteroid1 = duplicate() as Asteroid
	var newAsteroid2 = duplicate() as Asteroid
	get_parent().add_child(newAsteroid1)
	get_parent().add_child(newAsteroid2)
	
	var newSize = Size.Medium
	if size == Size.Medium: newSize = Size.Small
	
	newAsteroid1.size = newSize
	newAsteroid2.size = newSize
	
	newAsteroid1._validate_size()
	newAsteroid2._validate_size()
	
	newAsteroid1.global_position = global_position + Vector2.RIGHT
	newAsteroid1.global_position = global_position + Vector2.LEFT
	
	queue_free()
	pass

func _physics_process(delta: float) -> void:
	var colliders = get_colliding_bodies()
	for obj in colliders:
		if !(obj is Ship): continue
		(obj as Ship)._take_dmg()
		
	pass
