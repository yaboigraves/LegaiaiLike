class_name TargettingPlayerInputState
extends PlayerInputState


var selectionIndex = 0
@export var targetTeam : Team

var targets : Array[Entity]

func enter(args = {}):
	super.enter(args)
	
	print("ok now we do targetting!!")
	targets = targetTeam.GetAliveEntities()
	
	selectionIndex = 0 
	UpdateSelection()



func update(delta):
	super.update(delta)
	
#	if Input.is_action_just_pressed("cancel"):
#		state_machine.transition_to("ComboPlayerInputState", {"entity": currentEntity})
#
#	elif currentEntity.actionBuffer.target != null and Input.is_action_just_pressed("confirm"):
#		print("now we can be done selected")
#		currentEntity.TurnReady.emit(currentEntity)
#		state_machine.transition_to("Idle", {"entity": currentEntity})
#
	
#	elif Input.is_action_just_pressed("up") and targetTeam.IsEntityAtIndexAlive(0):
#		currentEntity.actionBuffer.target = targetTeam.GetEntityAtIndex(0)
#		currentEntity.TargetChanged.emit(currentEntity.actionBuffer.target )
#		currentEntity.actionBuffer.target.Targeted.emit()
#	elif Input.is_action_just_pressed("down")  and targetTeam.IsEntityAtIndexAlive(2):
#		currentEntity.actionBuffer.target = targetTeam.GetEntityAtIndex(2)
#		currentEntity.TargetChanged.emit(currentEntity.actionBuffer.target )
#		currentEntity.actionBuffer.target.Targeted.emit()
##	elif Input.is_action_just_pressed("left"):
##		selection = Symbols.Direction.LEFT
#	elif Input.is_action_just_pressed("right") and targetTeam.IsEntityAtIndexAlive(1):
#		currentEntity.actionBuffer.target = targetTeam.GetEntityAtIndex(1)
#		currentEntity.TargetChanged.emit(currentEntity.actionBuffer.target )
#		currentEntity.actionBuffer.target.Targeted.emit()
	
	if Input.is_action_just_pressed("up"):
		selectionIndex = clamp(selectionIndex - 1, 0, targets.size())
		UpdateSelection()
	if Input.is_action_just_pressed("down"):
		selectionIndex = clamp(selectionIndex + 1, 0, targets.size() - 1 )
		UpdateSelection()
	
func UpdateSelection():
	pass
#	if currentEntity.actionBuffer.target != null:
#		currentEntity.actionBuffer.target.Untargeted.emit()
#
#	currentEntity.actionBuffer.target = targets[selectionIndex]
#	currentEntity.TargetChanged.emit(currentEntity.actionBuffer.target )
#	currentEntity.actionBuffer.target.Targeted.emit()

func exit():
	super.exit()
#	if currentEntity.actionBuffer.target != null:
#		currentEntity.actionBuffer.target.Untargeted.emit()
