class_name PlayerControlledEntity
extends Entity

var actionBuffer : ActionBuffer

var upAction: Action
var downAction : Action
var leftAction: Action
var rightAction : Action

signal ActionBufferUpdated
signal TargetChanged(target: Entity)


func _ready() -> void:
	super._ready()
	
	#so we gotta actually like spawn our actions now
	#cause they start as packed scenes
	#so entities can create child nodes for these
	#kind of annoying but whatever
	if entityData.upAction:
		upAction = entityData.upAction.instantiate()
	
	if entityData.leftAction:
		leftAction = entityData.leftAction
	
	if entityData.downAction:
		downAction = entityData.downAction
	
	if entityData.rightAction:
		rightAction = entityData.rightAction
	
	set_process(false)


func DoTurn():
	super.DoTurn()
	actionBuffer = ActionBuffer.new(ap)
	
	
	
	#TODO: also make this part of a messenger
	#PlayerInputHandler.instance.StartPlayerControlledEntityTurn(self)

