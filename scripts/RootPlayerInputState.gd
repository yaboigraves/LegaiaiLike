class_name RootPlayerInputState
extends PlayerInputState



func enter(args = {}):
	super.enter(args)

	#SO here we actually fill in the entity data
	#good stuff, should be nice and easy
	#UI is now seperated across its actual game mode
	
	
	$ActionRadial.visible = true
	
	
func HandleInput(input:PlayerInput):


	if Input.is_action_just_pressed("up"):
		#state_machine.p("ComboPlayerInputState", {"entity" : currentEntity})
		print("combo time")
	elif Input.is_action_just_pressed("down"):
		print("spell")
	elif Input.is_action_just_pressed("left"):
		print("swap")
	elif Input.is_action_just_pressed("right"):
		print("item")
		
	#I wonder if we can just bind to the state machine event
	#ad match the state???
	
