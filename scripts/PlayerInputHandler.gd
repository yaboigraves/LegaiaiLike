class_name PlayerInputHandler
extends Node

signal GotPlayerInput(input: PlayerInput)

#player input handler basically just runs a state machine and loads bindings stuff later
static var instance : PlayerInputHandler
var stateMachine : StateMachine

func _init():
	instance = self

#no state machine, just package up input

func _ready() -> void:
#	stateMachine = $StateMachine as StateMachine
#	Messenger.EntityTurnStarted.connect(StartPlayerControlledEntityTurn)
	pass

#
#func StartPlayerControlledEntityTurn(entity : Entity):
#
#	if not entity is PlayerControlledEntity: return
#
#	stateMachine.transition_to("RootPlayerInputState",{"entity" : entity},true)
#
#

func _process(delta: float) -> void:
	var input = PlayerInput.new(
		(Input.get_axis("down","up")),
		(Input.get_axis("left","right")),
		Input.is_action_just_pressed("confirm"),
		Input.is_action_just_pressed("cancel"),
		Input.is_action_just_pressed("up"),
		Input.is_action_just_pressed("down"),
		Input.is_action_just_pressed("left"),
		Input.is_action_just_pressed("right"),
	)
	
	GotPlayerInput.emit(input)
