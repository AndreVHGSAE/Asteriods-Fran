class_name Ship extends RigidBody2D
#Export es para declarar variables, es el equivalente a [SerializeField]
@export_range(5,1) var hitPoint = 3

@export_range(200, 800, 15) var speed : float = 600
#PacketScene es como GameObject
@export_category("Shooting")
@export var bullet : PackedScene
@export var pivot : Node2D

var iFrames = 0
var scene : Node2D
@export var InitPos = Vector2.ZERO
var respawn_timer : NeoTimer = NeoTimer.new()

@onready var screen_size = get_viewport_rect().size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	InitPos = global_position
	
	
	
	respawn_timer.on_completion.connect(respawn)
	respawn_timer.done = true
	scene = get_parent()
	print_debug("Respawn")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	respawn_timer.tick(delta)
	screen_wrap()
	if iFrames > 0:
		contact_monitor = false
		iFrames -= 1
		pass
	if Input.is_action_just_pressed("Shoot"):
		_shoot()
	#"var" se refiere a una variable
	#Para especificar que tipo de variable es ": <tipo de variable>"
	var direction : Vector2 = Input.get_vector("Left","Right","Up","Down").normalized()
	linear_velocity = direction * speed
	pass
	
func _take_dmg() -> void:
	if iFrames > 0: return
	despawn()
	respawn_timer.start(1.5)
	if hitPoint <= 0:
		print_debug ("Ship Destroyed")
		queue_free() #Destroys the object
		pass
	
	global_position = InitPos
	pass
	
func despawn() -> void:
	hitPoint-=1
	get_parent().remove_child(self)
	pass

func respawn(parent : Node2D) -> void:
	parent.add_child(self)
	teleport(InitPos)
	linear_velocity = Vector2.ZERO
	iFrames = 10
	pass
	
func _shoot() -> void:
	var bulletObj = (bullet.instantiate() as ABullet)
	get_parent().add_child(bulletObj)
	bulletObj.global_position = pivot.global_position
	bulletObj.linear_velocity = Vector2.UP * 1000
	pass
	
func screen_wrap():
	#Detecta tu posición de los 4 laods individuales
	if global_position.x > screen_size.x:
		global_position.x = 1
	if global_position.x < -1:
		global_position.x = screen_size.x
	if global_position.y > screen_size.y:
		global_position.y = 1
	if global_position.y < -1:
		global_position.y = screen_size.y
	#position.x = wrapf(position.x, 0, 1152)
	#position.y = wrapf(position.y, 0, 648)
	pass
	
func teleport(pos : Vector2) -> void:
	PhysicsServer2D.body_set_state(
		get_rid(),
		PhysicsServer2D.BODY_STATE_TRANSFORM,
		Transform2D.IDENTITY.translated(pos)
	)
	pass
