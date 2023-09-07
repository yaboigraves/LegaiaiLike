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

	set_process(false)

func SetEntityData(entity_data:EntityData):
	super.SetEntityData(entity_data)
	
	
	
	if entity_data.upAction:
		upAction = entity_data.upAction.instantiate()
	
	if entity_data.leftAction:
		leftAction = entity_data.leftAction
	
	if entity_data.downAction:
		downAction = entity_data.downAction
	
	if entity_data.rightAction:
		rightAction = entity_data.rightAction
	


func DoTurn():
	super.DoTurn()
	actionBuffer = ActionBuffer.new(ap)
	
	
	
	#TODO: also make this part of a messenger
	#PlayerInputHandler.instance.StartPlayerControlledEntityTurn(self)

