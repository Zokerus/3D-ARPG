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
	if currentState.initialized:
		ChangeState(currentState.Process(delta))
		

func _physics_process(delta: float) -> void:
	if currentState.initialized:
		ChangeState(currentState.PhysicsProcess(delta))

func _unhandled_input(event: InputEvent) -> void:
	if currentState.initialized:
		if ChangeState(currentState.HandleInput(event)):
			currentState.HandleInput(event)

func ChangeState(state: BaseState)-> bool:
	if state:
		if state.initialized:
			currentState.Exit()
			currentState = state
			currentState.Enter()
			return true
	return false
