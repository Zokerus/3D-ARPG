extends BaseState
class_name JumpState

@export var idleState: BaseState

var leftFloor: bool = false

func _ready() -> void:
	stateName = "Jump"
	
func Enter()-> void:
	leftFloor = false

func PhysicsProcess(delta: float) -> BaseState:
	super.PhysicsProcess(delta)
	
	if character.movementDirection == Vector3.ZERO and character.is_on_floor() and leftFloor:
		return idleState
	
	if !character.is_on_floor():
		leftFloor = true
	
	return null

func HandleInput(event: InputEvent) -> BaseState:
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and character.is_on_floor():
		animationTree.set("parameters/Locomotion/transition_request", "Jump")
	
	return null
