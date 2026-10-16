extends Node2D

func _init() -> void:
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print_debug("Game Started")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("Shoot")) : print_debug ("Shooted")
	if (Input.is_action_just_pressed("Up")) : print_debug ("Going up")
	if (Input.is_action_just_pressed("Down")) : print_debug ("Going down")
	if (Input.is_action_just_pressed("Left")) : print_debug ("Going left")
	if (Input.is_action_just_pressed("Right")) : print_debug ("Going right")
	pass

func _physics_process(delta: float) -> void:
	pass
