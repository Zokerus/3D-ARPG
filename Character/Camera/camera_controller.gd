extends Node3D
class_name CameraController

@export var character: PlayerCharacter

var h_Sensetivity: float = 100
var v_Sensetivity: float = 100
var Invert_YAxis: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	position = character.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = character.position
