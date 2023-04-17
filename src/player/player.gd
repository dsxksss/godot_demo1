extends CharacterBody2D
class_name Player
@onready var heart_component:HeartComponent = $heart_component

# 移动速度
const MAX_SPEED:float = 125
# 加速度
const ACCELERATION_SMOOTHING:float = 25

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	# 基础移速
	var target_velocity = direction * MAX_SPEED
	# 添加加速度之后赋值给角色移动
	velocity = velocity.lerp(target_velocity,1 - exp(-delta * ACCELERATION_SMOOTHING))
	# 根据 velocity 移动该物体
	move_and_slide()
	
# 获取玩家移动偏移量
func get_movement_vector() -> Vector2:
	var x_movement = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_movement = Input.get_action_strength("down") - Input.get_action_strength("up")
	return Vector2(x_movement,y_movement)
 
