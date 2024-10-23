extends BaseState
class_name IdleState

# Called every frame. 'delta' is the elapsed time since the previous frame.
func PhysicsProcess(delta: float) -> void:
	super.PhysicsProcess(delta)
	animationTree.set("parameters/Locomotion/transition_request", "Idle")
