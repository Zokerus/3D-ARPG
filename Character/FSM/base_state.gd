extends Node
class_name BaseState

var stateManager: StateManager
var character: CharacterBody3D
var animationTree: AnimationTree

var initialized: bool = false

func Init(state_Manager: StateManager, characterBody: CharacterBody3D, animTree: AnimationTree) -> void:
	self.stateManager = state_Manager
	self.character = characterBody
	self.animationTree = animTree
	initialized = true

func Enter()-> void:
	pass
	
func Exit()-> void:
	pass

func Process(delta: float) -> BaseState:
	return null
	
func PhysicsProcess(delta: float) -> BaseState:
	return null

func HandleInput(event: InputEvent) -> BaseState:
	return null
