class_name PlayerControlledEntity
extends Entity

var actionBuffer : ActionBuffer

@export var upAction: Action
@export var downAction : Action
@export var leftAction: Action
@export var rightAction : Action

signal ActionBufferUpdated
signal TargetChanged(target: Entity)


func _ready() -> void:
	set_process(false)

func DoTurn():
	super.DoTurn()
	actionBuffer = ActionBuffer.new()
	PlayerInputHandler.instance.StartPlayerControlledEntityTurn(self)

