extends Sprite2D

@onready var Explostion = preload("res://scenes/items/explosion/Explosion.tscn")
@onready var PrimaryBullet = preload("res://scenes/bullets/primary/PrimaryBullet.tscn")

var _fighter : Sprite2D = null
var speed = 2
var shooting = true

@export var fire_time_threshold = 0.1
var fire_time = fire_time_threshold

func _process(delta):
	var target_position = _fighter.global_position
	var current_position = global_position
	var new_position = current_position.lerp(target_position, speed * delta)
	new_position.y = current_position.y
	global_position = new_position
	if shooting:
		var bullet = PrimaryBullet.instantiate()
		if fire_time <= 0:
			bullet.position = self.global_position + Vector2(0, texture.get_height() / 2.0)
			bullet.init_rotation = PI / 2
			bullet.speed = 2000
			get_tree().root.add_child(bullet)
			fire_time = fire_time_threshold
		else:
			fire_time -= delta
			
func _ready():
	_fighter = get_node("../Fighter")
	
func _on_area_2d_area_entered(area):
	if area.is_in_group("bullets"):
		var explosion = Explostion.instantiate()
		explosion.position = area.global_position
		get_tree().root.add_child(explosion)
		area.get_parent().queue_free()


func _on_timer_timeout():
	shooting = !shooting # Replace with function body.
