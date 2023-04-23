extends Sprite2D

@export var rotate_clockwise = false
@export var rotation_degree = 2 * PI

@onready var BladeBullet = preload("res://scenes/bullets/blade/BladeBullet.tscn")
@export var fire_time_threshold = 0.02

var fire_time = fire_time_threshold

func _process(delta):
	if rotate_clockwise:
		rotation += rotation_degree * delta
	else :
		rotation -= rotation_degree * delta
	var bullet = BladeBullet.instantiate()
	if fire_time <= 0:
		bullet.position = self.global_position
		bullet.init_rotation = rotation
		get_tree().root.add_child(bullet)
		fire_time = fire_time_threshold
	else:
		fire_time -= delta
			
func _on_timer_timeout():
	rotate_clockwise = !rotate_clockwise
