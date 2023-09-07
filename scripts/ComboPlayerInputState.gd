class_name ComboPlayerInputState
extends PlayerInputState

#really we just want to control what happens from here...
#I think we ought to just pass a struct for input in
#so when we enter into the combo player state we pass an entity to pipe input to
#that makes sense

#so here we would want to issue UI events as well keep in mind
#but it should be easier to do that later
#so this actually ought to absorb some gameplay related code tbh
#I think we do want to technically call entity code here

#so yeah this ought to steer entities and be more part of phase i guess
#we're only ever controlling one entity at a time so
#seems fine



func enter(_msg ={}):
	super.enter(_msg)
	
	$ActionRadial.SetActions(current_entity)
	$ActionRadial.visible = true
	$ComboDisplay.visible = true

func HandleInput(input:PlayerInput):
	if input.confirm:
		#so how do we handle this
		#its more like we tell this to the messenger
		#this is more like the turn combo being entered
		#targets havent been picked yet
		#this is kinda tricky
		#targets
		#shiiiet
		#i think it makes more sense to to party health
		#or a tug of war actually
		#honestly a tug of war with multipliers for damage sounds kinda dope
		#I think adding gear that you make the combos off
		#actually makes this kind of more interesting
		#because different gear can have different combos equipped
		#and it can let you play a different role for a moment
		#almost like a persona...
		#so you actually start with gear selection
		#and gear has moves equipped onto it
		#yeah I like that
		#lets roll with it for now
		
		#
		
		
		current_entity.TurnReady.emit(current_entity)
	

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
