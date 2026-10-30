extends Node

@export var ScoreDisplay : TextEdit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ScoreDisplay.text = "Score: " + str(GameManager.score)
	pass
