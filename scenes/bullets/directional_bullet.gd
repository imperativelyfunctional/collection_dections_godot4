extends Bullet
@export var init_rotation = 0

func _ready():
	super._ready()
	rotate(init_rotation)
