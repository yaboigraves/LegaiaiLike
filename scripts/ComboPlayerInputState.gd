class_name ComboPlayerInputState
extends PlayerInputState

#so here we are
#finally doing combos and action points again
#SO
#this is the big shebang in terms of how the architecture ought to work
#after this is implemented in a basic form we ought to go make sure turn order works
#also figure out how enemy class structure looks, is there any difference?
#is there really a need for a difference? I dont fully think so
#so we can first just handle input



func enter(_msg ={}):
	super.enter(_msg)
	
	$ActionRadial.SetActions(current_entity)
	$ActionRadial.visible = true
	$ComboDisplay.visible = true

func HandleInput(input:PlayerInput):
	if input.cancel:
		#TODO: add code to remove elements from action buffer
		
		pass
	elif input.confirm:
		
		current_entity.ProcessActionBuffer()
		
		#move into the player processing state
		#this goes through and does the actual reading and processing of the stack
		state_machine.transition_to("ProcessingComboPlayerInputState")
	
	if input.up:
		if current_entity.TryAddDirectionToCombo(Symbols.Direction.UP):
			$ComboDisplay.RefreshComboView(current_entity.actionBuffer)
	if input.down:
		if current_entity.TryAddDirectionToCombo(Symbols.Direction.DOWN):
			$ComboDisplay.RefreshComboView(current_entity.actionBuffer)
	if input.left:
		if current_entity.TryAddDirectionToCombo(Symbols.Direction.LEFT):
			$ComboDisplay.RefreshComboView(current_entity.actionBuffer)
	if input.right:
		if current_entity.TryAddDirectionToCombo(Symbols.Direction.RIGHT):
			$ComboDisplay.RefreshComboView(current_entity.actionBuffer)
		
		
#this code is terrible re-write later
func update(_delta: float):
	pass
	


#	if Input.is_action_just_pressed("confirm") and currentEntity.actionBuffer.IsValidCombo():
#		#currentEntity.TurnReady.emit(currentEntity)
#		state_machine.transition_to("TargettingPlayerInputState",{"entity": currentEntity})
##
#	elif Input.is_action_just_pressed("cancel"):
#		if currentEntity.actionBuffer.actions.size() > 0:
#			currentEntity.actionBuffer.RemoveLastAction()
#			currentEntity.ActionBufferUpdated.emit(currentEntity.actionBuffer)
#		else:
#			state_machine.transition_to("RootPlayerInputState", {"entity": currentEntity})
#	elif Input.is_action_just_pressed("up"):
#		if currentEntity.actionBuffer.TryAddAction(currentEntity.upAction):
#			currentEntity.ActionBufferUpdated.emit(currentEntity.actionBuffer)
#
#	elif Input.is_action_just_pressed("down"):
#		if currentEntity.actionBuffer.TryAddAction(currentEntity.downAction):
#			currentEntity.ActionBufferUpdated.emit(currentEntity.actionBuffer)
#
#	elif Input.is_action_just_pressed("left"):
#		if currentEntity.actionBuffer.TryAddAction(currentEntity.leftAction):
#			currentEntity.ActionBufferUpdated.emit(currentEntity.actionBuffer)
#
#	elif Input.is_action_just_pressed("right"):
#		if currentEntity.actionBuffer.TryAddAction(currentEntity.rightAction):
#			currentEntity.ActionBufferUpdated.emit(currentEntity.actionBuffer)
#


func exit():
	super.exit()
	$ActionRadial.visible = true
	$ComboDisplay.visible = true
