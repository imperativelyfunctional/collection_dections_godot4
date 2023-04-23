extends Bullet

@export var amplitude: float = 100
@export var frequency: int = 10
@export var _offset: float = 0

func _ready():
	super._ready()
	rotate(-PI / 2)

func _process(delta):
	super._process(delta)
	_offset += delta
	position += transform.y * cos(_offset * frequency) * amplitude * delta
