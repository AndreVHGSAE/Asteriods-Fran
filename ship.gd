class_name Ship extends RigidBody2D
#Export es para declarar variables, es el equivalente a [SerializeField]
@export_range(200, 800, 15) var speed : float = 600
#PacketScene es como GameObject
@export_category("Shooting")
@export var bullet : PackedScene
@export var pivot : Node2D

@onready var screen_size = get_viewport_rect().size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	screen_wrap()
	pass
	
func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("Shoot"):
		_shoot()
	#"var" se refiere a una variable
	#Para especificar que tipo de variable es ": <tipo de variable>"
	var direction : Vector2 = Input.get_vector("Left","Right","Up","Down").normalized()
	linear_velocity = direction * speed
	pass
	
func _take_dmg() -> void:
	print_debug ("Ship Destroyed")
	queue_free() #Destroys the object
	pass
	
func _shoot() -> void:
	var bulletObj = (bullet.instantiate() as Bullet)
	get_parent().add_child(bulletObj)
	bulletObj.global_position = pivot.global_position
	bulletObj.linear_velocity = Vector2.UP * 1000
	pass
	
func screen_wrap():
	if position.x > screen_size.x:
		position.x = 0
		print_debug ("TP X to left")
	if position.x < 0:
		position.x = screen_size.x
		print_debug ("TP X to right")
	if position.y > screen_size.y:
		position.y = 0
		print_debug ("TP Y to up")
	if position.y < 0:
		position.y = screen_size.y
		print_debug ("TP X to down")
	#position.x = wrapf(position.x, 0, 1152)
	#position.y = wrapf(position.y, 0, 648)
	pass
