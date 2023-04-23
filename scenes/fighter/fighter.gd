extends Sprite2D

@onready var left: AnimatedSprite2D = $LeftOrb
@onready var right: AnimatedSprite2D = $RightOrb

@export var speed: int = 400
@export var direction = Vector2.ZERO
@export var fire_time_threshold = 0.1

var fire_time = fire_time_threshold
var _bullet_type = BulletFactory.ARROW_BULLET
	
func _process(delta):
	_control_player(delta)
	if fire_time <= 0:
		_fire(_bullet_type)
		fire_time = fire_time_threshold
	else:
		fire_time -= delta

func _control_player(delta) :
	if Input.is_action_pressed("PLAYER_RIGHT"):
		direction.x = 1
	elif Input.is_action_pressed("PLAYER_LEFT"):
		direction.x = -1
	elif Input.is_action_just_released("PLAYER_RIGHT") or Input.is_action_just_released("PLAYER_LEFT"):
		direction.x = 0
		
	if Input.is_action_pressed("PLAYER_DOWN"):
		direction.y = 1
	elif Input.is_action_pressed("PLAYER_UP"):
		direction.y = -1
	elif Input.is_action_just_released("PLAYER_DOWN") or Input.is_action_just_released("PLAYER_UP"):
		direction.y = 0
		
	position += direction * speed * delta
	var half_width = texture.get_width() / 2.0
	var half_height = texture.get_height() / 2.0
	position.x = clamp(position.x , half_width, get_viewport_rect().size.x - half_width)
	position.y = clamp(position.y , half_height, get_viewport_rect().size.y - half_height)
	
func _fire(bullet_type):
	var bullet1 = BulletFactory.create_bullet(bullet_type)
	bullet1.position = left.global_position + Vector2(0, - 30)
	get_parent().add_child(bullet1)
	var bullet2 = BulletFactory.create_bullet(bullet_type)
	bullet2.position = right.global_position + Vector2(0, - 30)
	get_parent().add_child(bullet2)
	var bullet3 = BulletFactory.create_bullet(bullet_type)
	bullet3.position = position + Vector2(0, - 60)
	get_parent().add_child(bullet3)


func _on_area_2d_area_entered(area):
	if area.is_in_group("bullet_types"):
		_bullet_type = area.get_parent().get_meta("type")
		area.get_parent().queue_free()
	elif area.is_in_group("enemy_bullets"):
		area.get_parent().queue_free()
