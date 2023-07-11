class_name RootPlayerInputState
extends PlayerInputState



func enter(args = {}):
	super.enter(args)
	
	
func update(delta):
	super.update(delta)
	
	#probably better to just have the up button literally do the thing
	#selection isnt necessary
	
	#so I think these two state machines are semi redundant
	#might need more UI states
	#but I guess the idea
	#will be that we listen for the state machine changes here
	#and enable/disable ui listening stuff
	#so the ui should just be listening at endpoints
	#like I said
	#we need more ui states than just player turn too
	#we need each radial kinda thing
	#so from here, we literally listen for input, and tell the entity to do stuff
	#like here, we just want to listen for up or down to move into the next state
	
	
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
	
