extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _fmt(number):
	return str(number).pad_decimals(2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var playership = get_node("/root/World/PlayerShip/ShipRigidBody") as RigidBody
	var t = playership.get_global_transform()
	var f = playership.get_facing()
	var v = playership.get_linear_velocity()
	
	$PositionLbl.set_text("Position:" +\
		"\n   X: " + _fmt(t.origin.x) +\
		"\n   Y: " + _fmt(t.origin.y) +\
		"\n   Z: " + _fmt(t.origin.z))
	
	$VelocityLbl.set_text("Velocity:" +\
		"\n   vX: " + _fmt(v.x) +\
		"\n   vY: " + _fmt(v.y) +\
		"\n   vZ: " + _fmt(v.z))

	$FacingLbl.set_text("Facing: (" + _fmt(f.x) + " / " +\
		_fmt(f.y) + " / " + _fmt(f.z) + ")")
