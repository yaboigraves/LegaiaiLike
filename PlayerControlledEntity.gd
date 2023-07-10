class_name PlayerControlledEntity
extends Entity

var actionBuffer : ActionBuffer



@export var upAction: Action
@export var downAction : Action
@export var leftAction: Action
@export var rightAction : Action

signal ActionBufferUpdated

func _ready() -> void:
	set_process(false)

func DoTurn():
	super.DoTurn()
	set_process(true)
	actionBuffer = ActionBuffer.new()
	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("confirm") and actionBuffer.IsValidCombo():
		TurnReady.emit(self)
		set_process(false)
	
	elif Input.is_action_just_pressed("cancel"):
		actionBuffer.RemoveLastAction()
		ActionBufferUpdated.emit(actionBuffer)
	
	elif Input.is_action_just_pressed("up"):
		if actionBuffer.TryAddAction(upAction):
			ActionBufferUpdated.emit(actionBuffer)
		
	elif Input.is_action_just_pressed("down"):
		if actionBuffer.TryAddAction(downAction):
			ActionBufferUpdated.emit(actionBuffer)
		
	elif Input.is_action_just_pressed("left"):
		if actionBuffer.TryAddAction(leftAction):
			ActionBufferUpdated.emit(actionBuffer)
	
	elif Input.is_action_just_pressed("right"):
		if actionBuffer.TryAddAction(rightAction):
			ActionBufferUpdated.emit(actionBuffer)
