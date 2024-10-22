extends CharacterBody3D
class_name PlayerCharacter

@export var mainCamera: CameraController

@onready var animationTree: AnimationTree = $AnimationTree

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const CHARACTER_ROTATION_RATE = 4*PI;

var movementDirection: Vector3 = Vector3.ZERO

func _ready() -> void:
	if !mainCamera:
		get_tree().quit()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	CalculateMovement(delta)
	var currentRotation: Quaternion = transform.basis.get_rotation_quaternion()
	var root_position: Vector3 = animationTree.get_root_motion_position()
	var root_velocity: Vector3 = (currentRotation.normalized() * root_position) / delta
	
	velocity.x = root_velocity.x
	velocity.y -= root_velocity.y
	velocity.z = root_velocity.z
	
	move_and_slide()
	mainCamera.position = self.position

func CalculateMovement(delta: float) -> void:
	var input_dir: Vector2 = Input.get_vector("Left", "Right", "Forward", "Backward")
	movementDirection = (mainCamera.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#animationTree.set("parameters/Running/blend_position", input_dir)
	
	if movementDirection != Vector3.ZERO:
		#var rotation_Angle: float = -transform.basis.z.signed_angle_to(movementDirection, Vector3.UP)
		#self.rotation.y = lerp_angle(self.rotation.y, atan2(-movementDirection.x, -movementDirection.z), CHARACTER_ROTATION_RATE * delta)
		animationTree.set("parameters/Locomotion/transition_request", "Move")
		animationTree.set("parameters/Movement/transition_request", "Walk")
	else:
		animationTree.set("parameters/Locomotion/transition_request", "Idle")
