extends Spatial

const MIN_VISUALIZED_SPEED = 10

var basepos = Vector3()

# Called when the node enters the scene tree for the first time.
func _ready():
	basepos = get_global_transform().origin
	print(str(basepos))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var v = get_parent().get_linear_velocity()
	if v.length_squared() < MIN_VISUALIZED_SPEED:
		hide()
		return
	else:
		show()
	var pos = get_global_transform().origin
	var target_direction = v + pos
	var up_direction = get_global_transform().basis.y
	$VelocityMarker.set_height(v.length())
	look_at(target_direction, up_direction)
