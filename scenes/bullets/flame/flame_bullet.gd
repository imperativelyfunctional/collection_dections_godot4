extends Bullet

func _ready():
	super._ready()
	rotate(-PI / 2)

func _process(delta):
	speed += delta * 1000
	super._process(delta)
