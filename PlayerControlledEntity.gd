class_name PlayerControlledEntity
extends Entity

var actionBuffer : ActionBuffer

@export var upAction: Resource
@export var downAction : Resource
@export var leftAction: Resource
@export var rightAction : Resource

func _ready() -> void:
	set_process(false)

func DoTurn():
	super.DoTurn()
	set_process(true)
	actionBuffer = ActionBuffer.new()
	
	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("confirm"):
		TurnDone.emit(self)
		set_process(false)
	
	elif Input.is_action_just_pressed("up"):
		pass
	
	elif Input.is_action_just_pressed("down"):
		pass
		
	elif Input.is_action_just_pressed("left"):
		pass
	
	elif Input.is_action_just_pressed("right"):
		pass
