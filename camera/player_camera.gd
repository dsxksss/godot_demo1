extends Camera2D

var target_position = Vector2.ZERO

func _ready() -> void:
	# 成为当前的活动相机
	make_current()

func _process(delta: float) -> void:
	acquire_target()
	# 平滑移动视角
	global_position = global_position.lerp(target_position,1.0 - exp(-delta * 20))
	
# 视角移动
func acquire_target():
	var player = $%player as Node2D
	target_position =player.global_position
