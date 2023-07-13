class_name PlayerControlledEntity
extends Entity

var actionBuffer : ActionBuffer

#these actions ought to be in the resource as well

var upAction: Action
var downAction : Action
var leftAction: Action
var rightAction : Action

signal ActionBufferUpdated
signal TargetChanged(target: Entity)


func _ready() -> void:
	super._ready()
	
	upAction = entityData.upAction
	leftAction = entityData.leftAction
	downAction = entityData.downAction
	rightAction = entityData.rightAction
	
	set_process(false)


func DoTurn():
	super.DoTurn()
	actionBuffer = ActionBuffer.new(ap)
	PlayerInputHandler.instance.StartPlayerControlledEntityTurn(self)

