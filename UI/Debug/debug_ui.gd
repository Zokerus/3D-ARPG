extends Control
class_name DebugUI

@export var player: PlayerCharacter

@onready var label: Label = $Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player_position: Vector3 = player.global_position
	label.text = "Player Position: (%.2f, %.2f, %.2f)\n" % [player_position.x, player_position.y, player_position.z]
	label.text += "Player Direction: %.2f\n" % [player.rotation_degrees.y]
	label.text += "State: " + player.stateManager.currentState.stateName + "\n"
	#label.text += "Movement Direction: (%.2f, %.2f)\n" % [player.movementDirection.x, player.movementDirection.z]
