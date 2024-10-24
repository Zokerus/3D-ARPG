extends BaseState
class_name IdleState

# Called every frame. 'delta' is the elapsed time since the previous frame.
func PhysicsProcess(delta: float) -> void:
	super.PhysicsProcess(delta)
	animationTree.set("parameters/Locomotion/transition_request", "Idle")

func HandleInput(event: InputEvent) -> void:
	var input_dir: Vector2 = Input.get_vector("Left", "Right", "Forward", "Backward")
	if input_dir != Vector2.ZERO:
		pass
