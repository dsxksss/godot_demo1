extends Node
class_name HeartComponent

signal died # 死亡
signal heart_changed(current_health:float) # 血量改变

var current_health:float

func _ready() -> void:
	# 初始化血量为0
	current_health = 100

func damage(damage_amount:float)->void:
	# max函数只取两边的最大值
	current_health = max(current_health - damage_amount, 0)
	emit_signal("heart_changed",current_health)
	# 在下一个空闲帧中再调用检查是否受伤死亡函数
	Callable(check_death).call_deferred()
	print(current_health)

func check_death()->void:
	if current_health <= 0:
		emit_signal("died")
		# 释放
		owner.queue_free()
