extends BaseState
class_name IdleState

# Called every frame. 'delta' is the elapsed time since the previous frame.
func PhysicsProcess(delta: float) -> BaseState:
	super.PhysicsProcess(delta)
	animationTree.set("parameters/Locomotion/transition_request", "Idle")
	return null

func HandleInput(event: InputEvent) -> BaseState:
	var input_dir: Vector2 = Input.get_vector("Left", "Right", "Forward", "Backward")
	if input_dir != Vector2.ZERO:
		pass
	
	return null
