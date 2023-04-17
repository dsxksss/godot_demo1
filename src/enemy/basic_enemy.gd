extends CharacterBody2D
class_name BasicEnemy

const SPEED = 40

func _process(delta: float) -> void:
	var direction = get_player_position()
	velocity = direction * SPEED
	move_and_slide()
	
func get_player_position() -> Vector2:
	var player_node = get_tree().get_first_node_in_group("player") as CharacterBody2D	 
	if player_node != null:
		# 返回当前敌人与玩家的坐标距离
		return (player_node.global_position - global_position).normalized()
	return Vector2.ZERO
