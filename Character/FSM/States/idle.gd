extends BaseState
class_name IdleState

@export var jumpState: BaseState
@export var moveState: BaseState

func _ready() -> void:
	stateName = "Idle"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func PhysicsProcess(delta: float) -> BaseState:
	super.PhysicsProcess(delta)
	animationTree.set("parameters/Locomotion/transition_request", "Idle")
	
	if character.inputDirection != Vector2.ZERO:
		return moveState
	return null

func HandleInput(event: InputEvent) -> BaseState:
	if Input.is_action_just_pressed("Jump") and character.is_on_floor():
		return jumpState
	return null
