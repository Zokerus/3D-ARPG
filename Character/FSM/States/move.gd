extends BaseState
class_name MoveState

@export var idleState: BaseState
@export var jumpState: BaseState

func _ready() -> void:
	stateName = "Move"

func PhysicsProcess(delta: float) -> BaseState:
	super.PhysicsProcess(delta)
	
	CalculateMovement(character.inputDirection, delta)
	
	if character.movementDirection == Vector3.ZERO and character.inputDirection == Vector2.ZERO and character.is_on_floor():
		return idleState
	return null

func HandleInput(event: InputEvent) -> BaseState:
	if Input.is_action_just_pressed("ui_accept") and character.is_on_floor():
		return jumpState
	
	return null

func CalculateMovement(input_dir: Vector2, delta: float) -> void:
	character.movementDirection = (character.mainCamera.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	var rotation_Angle: float = character.transform.basis.z.signed_angle_to(character.movementDirection, Vector3.UP)
	character.rotate_y(signf(rotation_Angle) * minf(character.CHARACTER_ROTATION_RATE * delta, absf(rotation_Angle)))
	
	if character.movementDirection != Vector3.ZERO:
		animationTree.set("parameters/Locomotion/transition_request", "Move")
		animationTree.set("parameters/Movement/transition_request", "Walk")
