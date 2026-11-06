extends Node

@export var ScoreDisplay : TextEdit
@export var LivesDisplay : TextEdit

var player_ship : Ship

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_parent().get_children():
		if child is Ship: player_ship = child
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ScoreDisplay.text = "Score: " + str(GameManager.score)
	if player_ship != null:
		LivesDisplay.text = "Lives: " + str(player_ship.hitPoint)
	else:
		LivesDisplay.text = "Lives: 0"
	pass
