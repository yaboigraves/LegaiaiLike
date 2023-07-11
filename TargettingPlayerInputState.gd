class_name TargettingPlayerInputState
extends PlayerInputState

#selection can be up down left or right

var selection : Symbols.Direction
@export var targetTeam : Team

func enter(args = {}):
	super.enter(args)
	
	print("ok now we do targetting!!")
	
func update(delta):
	super.update(delta)
	if Input.is_action_just_pressed("cancel"):
		state_machine.transition_to("ComboPlayerInputState", {"entity": currentEntity})
	
	elif currentEntity.actionBuffer.target != null and Input.is_action_just_pressed("confirm"):
		print("now we can be done selected")
		currentEntity.TurnReady.emit(currentEntity)
	
	elif Input.is_action_just_pressed("up") and targetTeam.IsEntityAtIndexAlive(0):
		currentEntity.actionBuffer.target = targetTeam.GetEntityAtIndex(0)
		currentEntity.TargetChanged.emit(currentEntity.actionBuffer.target )
	elif Input.is_action_just_pressed("down")  and targetTeam.IsEntityAtIndexAlive(2):
		currentEntity.actionBuffer.target = targetTeam.GetEntityAtIndex(2)
		currentEntity.TargetChanged.emit(currentEntity.actionBuffer.target )
#	elif Input.is_action_just_pressed("left"):
#		selection = Symbols.Direction.LEFT
	elif Input.is_action_just_pressed("right") and targetTeam.IsEntityAtIndexAlive(1):
		currentEntity.actionBuffer.target = targetTeam.GetEntityAtIndex(1)
		currentEntity.TargetChanged.emit(currentEntity.actionBuffer.target )

