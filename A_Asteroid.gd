@abstract class_name A_Asteroid extends RigidBody2D

var On_Dmg_Tkn_Signal: Signal

@export_range(0,500) var reward : int = 10

@abstract func on_Dmg_Tkn() -> void

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	body_entered.connect(damage_ship)
	pass
	
func damage_ship(other : RigidBody2D) -> void:
	if !(other is Ship): return
	(other as Ship)._take_dmg()
	pass
	
func take_dmg() -> void:
	GameManager.score += reward
	on_Dmg_Tkn()
	On_Dmg_Tkn_Signal.emit()
	pass
	
func _take_dmg() -> void:
	On_Dmg_Tkn_Signal.emit()
	on_Dmg_Tkn()
	GameManager.score += reward
	pass
	
