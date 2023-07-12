class_name PlayerInputHandler
extends Node

#player input handler basically just runs a state machine and loads bindings stuff later
static var instance : PlayerInputHandler
var stateMachine : StateMachine

func _init():
	instance = self

func _ready() -> void:
	stateMachine = $StateMachine as StateMachine

func StartPlayerControlledEntityTurn(entity : PlayerControlledEntity):
	stateMachine.transition_to("RootPlayerInputState",{"entity" : entity},true)


