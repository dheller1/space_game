extends CSGCylinder


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var v = get_parent().get_linear_velocity()
	set_height(v.length())
	look_at(v, get_parent().get_global_transform().basis.z)
