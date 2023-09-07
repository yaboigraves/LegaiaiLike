class_name TargettingPlayerInputState
extends PlayerInputState


var selectionIndex = 0

var targets : Array[Entity]

func enter(args = {}):
	super.enter(args)
	print("ok now we do targetting!!")
	
	#if current_entity.gear == blah type
	#assume targetting mode is single for now
	
	SetupSingleTargetting()


func SetupSingleTargetting():
	#so look at the current entity, find the team they're not on
	#blackboard ask for an enemy team by an entity
	targets = BattleBlackboard.Instance.GetEnemyTeamMembersByEntity(current_entity)
	selectionIndex = 0 
	$TargettingView.SetTarget(targets[selectionIndex])

func HandleInput(input:PlayerInput):
	
	
	#tell the current entity it's targetted?
	#or move a ui element around
	#probably more like move a UI element around
	#we can assume entities have positions
	
	if input.cancel:
		state_machine.transition_to("RootPlayerInputState")
		return
	
	if input.confirm:
		#set the current target for this ability
		#we can probably add this to the entity?
		#say entity this is the target of your next ability
		
		#i think thats fine for now
		current_entity.SetTurnTargets(targets.duplicate())
		
		state_machine.transition_to("ComboPlayerInputState")
		
	if input.up:
		selectionIndex = clampi(selectionIndex -1, 0, targets.size() -1)
		print("target is ", targets[selectionIndex].name)
		$TargettingView.SetTarget(targets[selectionIndex])
	elif input.down:
		selectionIndex = clampi(selectionIndex +1, 0, targets.size() -1)
		print("target is ", targets[selectionIndex].name)
		$TargettingView.SetTarget(targets[selectionIndex])

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
	$TargettingView.ClearTarget()
#	if currentEntity.actionBuffer.target != null:
#		currentEntity.actionBuffer.target.Untargeted.emit()
