extends Sprite2D
class_name BulletType

@export var texture_path : String = BulletConstants.CIRCULAR_RES

func _ready():
	texture = load(texture_path)
	if texture_path == BulletConstants.CIRCULAR_RES:
		set_meta("type", BulletFactory.CIRCULAR_BULLET)
	elif texture_path == BulletConstants.FLAME_RES:
		set_meta("type", BulletFactory.FLAME_BULLET)
	else :
		set_meta("type", BulletFactory.ARROW_BULLET)
	rotate(PI / 2)

func _process(delta):
	position += transform.x * 40 * delta
