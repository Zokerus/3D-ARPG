extends Node
class_name StateManager

@export var initialState: BaseState
@export var character: CharacterBody3D
@export var animationTree: AnimationTree

var currentState: BaseState

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentState = initialState

func ParentReady() -> void:
	for state: BaseState in get_children():
		state.Init(self, character, animationTree)
	currentState.Enter()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	currentState.Process(delta)

func _physics_process(delta: float) -> void:
	currentState.PhysicsProcess(delta)
