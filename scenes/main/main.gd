extends Node2D

@onready var BulletType = preload("res://scenes/bullets/types/BulletType.tscn")

func _on_bullet_change_timer_timeout():
	var bullet_type : BulletType = BulletType.instantiate()
	var window_width = get_viewport_rect().size.x
	bullet_type.position = Vector2(clamp(randi_range(0, window_width), 30, window_width - 30), 20)
	bullet_type.texture_path = BulletConstants.BULLET_RES[randi_range(0, BulletConstants.BULLET_RES.size() - 1)]
	get_parent().add_child(bullet_type)
