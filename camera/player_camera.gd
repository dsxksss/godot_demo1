extends Camera2D

# 相机聚焦至玩家的移动速度
const CAMERA_MOVE_SPEED = 2

@onready var player:Player = $%player

func _ready() -> void:
	# 成为当前的活动相机
	make_current()

func _process(delta: float) -> void:
	# 平滑移动视角
	global_position = global_position.lerp(get_player_position(),1.0 - exp(-delta * CAMERA_MOVE_SPEED))
	
# 视角移动
func get_player_position() -> Vector2:
	if player == null:
		return Vector2.ZERO
	return player.global_position
