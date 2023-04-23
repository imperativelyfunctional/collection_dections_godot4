extends Node2D
class_name Bullet

@export var speed: int = 600

func _ready():
	var notifier = VisibleOnScreenNotifier2D.new()
	notifier.connect("screen_exited", _on_visible_on_screen_notifier_2d_screen_exited)
	add_child(notifier)
	
func _process(delta):
	position += transform.x * speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
