extends BaseState
class_name JumpState

@export var idleState: BaseState

func _ready() -> void:
	stateName = "Jump"

func PhysicsProcess(delta: float) -> BaseState:
	super.PhysicsProcess(delta)
	
	if character.movementDirection == Vector3.ZERO and character.is_on_floor():
		return idleState
	
	return null

func HandleInput(event: InputEvent) -> BaseState:
	var input_dir: Vector2 = Input.get_vector("Left", "Right", "Forward", "Backward")
		
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and character.is_on_floor():
		character.velocity.y = character.JUMP_VELOCITY
	
	return null
