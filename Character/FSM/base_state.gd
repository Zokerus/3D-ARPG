extends Node
class_name BaseState

var stateManager: StateManager
var character: CharacterBody3D
var animationTree: AnimationTree

func Init(state_Manager: StateManager, characterBody: CharacterBody3D, animTree: AnimationTree) -> void:
	self.stateManager = state_Manager
	self.character = characterBody
	self.animationTree = animTree

func Enter()-> void:
	pass
	
func Exit()-> void:
	pass
