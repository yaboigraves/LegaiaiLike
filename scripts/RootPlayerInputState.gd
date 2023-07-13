class_name RootPlayerInputState
extends PlayerInputState



func enter(args = {}):
	super.enter(args)
	
	
func update(delta):
	super.update(delta)

	if Input.is_action_just_pressed("up"):
		state_machine.transition_to("ComboPlayerInputState", {"entity" : currentEntity})
	
	elif Input.is_action_just_pressed("down"):
		print("spell")
	elif Input.is_action_just_pressed("left"):
		print("swap")
	elif Input.is_action_just_pressed("right"):
		print("item")
		
	#I wonder if we can just bind to the state machine event
	#ad match the state???
	
