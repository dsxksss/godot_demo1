extends Area2D
class_name HurtboxComponent

signal hit

@export var health_component: HeartComponent

func _on_area_entered(other_area: Area2D) -> void:
	if not other_area is HitboxComponent:
		return
	
	if health_component == null:
		return
	
	var hitbox_component = other_area as HitboxComponent
	health_component.damage(hitbox_component.damage)
	emit_signal("hit")
