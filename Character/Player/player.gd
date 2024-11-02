extends CharacterBody3D
class_name PlayerCharacter

@export var mainCamera: CameraController

@onready var animationTree: AnimationTree = $AnimationTree
@onready var stateManager: StateManager = $StateManager

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const CHARACTER_ROTATION_RATE = 4*PI;

var inputDirection: Vector2 = Vector2.ZERO
var movementDirection: Vector3 = Vector3.ZERO
var movement: Vector3 = Vector3.ZERO

var isJumping: bool = false	#in case of jumping, avoid root motion in vertical movement

func _ready() -> void:
	if !mainCamera:
		get_tree().quit()
	stateManager.ParentReady()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	#Handle directional input events
	inputDirection = Input.get_vector("Left", "Right", "Forward", "Backward")
	
	#Handle the StateManager physics process
	stateManager.PhysicsProcess(delta)

	var currentRotation: Quaternion = transform.basis.get_rotation_quaternion()
	var root_position: Vector3 = animationTree.get_root_motion_position()
	var root_velocity: Vector3 = (currentRotation.normalized() * root_position) / delta
	
	velocity.x = root_velocity.x
	if !isJumping:
		velocity.y += root_velocity.y
	velocity.z = root_velocity.z
	 
	move_and_slide()
	mainCamera.position = self.position

func _unhandled_input(event: InputEvent) -> void:
	stateManager.HandleInput(event)

func JumpAnimationTrigger()-> void:
	isJumping = true
	velocity.y = JUMP_VELOCITY
