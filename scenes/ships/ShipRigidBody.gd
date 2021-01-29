extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const THRUST_MULTI = 500.0
const ROLL_MULTI = 150.0
const PITCH_MULTI = 200.0
const YAW_MULTI = 100.0

const LS_HORZ = JOY_AXIS_0
const LS_VERT = JOY_AXIS_1
const RS_HORZ = JOY_AXIS_2
const RS_VERT = JOY_AXIS_3

const DEADZONE = 0.20

var facing = Vector3()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _activate(f):
	if abs(f) < DEADZONE:
		return 0
	return f

func _update_kinematic_fields(basis):
	facing = basis.xform(Vector3(0, 0, 1))

func get_facing():
	return facing

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var basis = get_global_transform().basis
	_update_kinematic_fields(basis)
	
	var torque = Vector3(0, 0, 0)
	
	var thr = -1 * _activate(Input.get_joy_axis(0, LS_VERT))
	var pitch = _activate(Input.get_joy_axis(0, RS_VERT))
	var roll = _activate(Input.get_joy_axis(0, LS_HORZ))
	var yaw = _activate(Input.get_joy_axis(0, RS_HORZ))
	
	add_central_force(basis.z * thr * THRUST_MULTI * delta)
	torque.x = pitch * PITCH_MULTI * delta
	torque.y = -yaw * YAW_MULTI * delta
	torque.z = roll * ROLL_MULTI * delta
	
	var thrust = get_global_transform().basis.z * thr
	
	add_torque(basis.xform(torque))

