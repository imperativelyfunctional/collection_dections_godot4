extends Node

const ARROW_BULLET = "arrow_bullet"
const CIRCULAR_BULLET = "circular_bullet"
const FLAME_BULLET = "flame_bullet"

const weapon_map = {
	ARROW_BULLET : preload("res://scenes/bullets/arrow/ArrowBullet.tscn"),
	CIRCULAR_BULLET : preload("res://scenes/bullets/circular/CircularBullet.tscn"),
	FLAME_BULLET : preload("res://scenes/bullets/flame/FlameBullet.tscn")
}

func create_bullet(bullet_type: String) -> Bullet:
	return weapon_map[bullet_type].instantiate()
