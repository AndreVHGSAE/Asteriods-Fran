class_name NeoTimer
var time_left : float = 0
var done : bool = false
var on_completion : Signal

func start(duration:float):
	time_left = duration
	done = false
	pass
	
func tick(delta:float) -> void:
	if done: return
	time_left-=delta
	if (time_left <= 0): 
		done = true
		time_left = 0
		on_completion.emit()
		pass
	pass
