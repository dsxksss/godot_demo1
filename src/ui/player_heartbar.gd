extends ProgressBar

@export var heart_component:HeartComponent

func _ready()-> void:
	heart_component.heart_changed.connect(on_heart_changed)
	
func on_heart_changed(current_health: float)-> void:
	value = current_health
