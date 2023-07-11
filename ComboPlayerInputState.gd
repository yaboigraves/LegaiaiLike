class_name ComboPlayerInputState
extends State

#really we just want to control what happens from here...
#I think we ought to just pass a struct for input in
#so when we enter into the combo player state we pass an entity to pipe input to
#that makes sense

#so here we would want to issue UI events as well keep in mind
#but it should be easier to do that later
#so this actually ought to absorb some gameplay related code tbh
#I think we do want to technically call entity code here

var currentEntity : PlayerControlledEntity

func enter(_msg ={}):
	super.enter(_msg)
	


func update(_delta: float):
	pass
#	if Input.is_action_just_pressed("confirm") and actionBuffer.IsValidCombo():
#		TurnReady.emit(self)
#		set_process(false)
#
#	elif Input.is_action_just_pressed("cancel"):
#		actionBuffer.RemoveLastAction()
#		ActionBufferUpdated.emit(actionBuffer)
#
#	elif Input.is_action_just_pressed("up"):
#		if actionBuffer.TryAddAction(upAction):
#			ActionBufferUpdated.emit(actionBuffer)
#
#	elif Input.is_action_just_pressed("down"):
#		if actionBuffer.TryAddAction(downAction):
#			ActionBufferUpdated.emit(actionBuffer)
#
#	elif Input.is_action_just_pressed("left"):
#		if actionBuffer.TryAddAction(leftAction):
#			ActionBufferUpdated.emit(actionBuffer)
#
#	elif Input.is_action_just_pressed("right"):
#		if actionBuffer.TryAddAction(rightAction):
#			ActionBufferUpdated.emit(actionBuffer)
#
