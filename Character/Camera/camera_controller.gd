extends Node3D
class_name CameraController

@export var character: CharacterBody3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = character.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = character.position
