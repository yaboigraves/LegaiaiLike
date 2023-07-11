class_name TargettingPlayerInputState
extends PlayerInputState

#selection can be up down left or right

var selection : Symbols.Direction

func enter(args = {}):
	super.enter(args)
	
	print("ok now we do targetting!!")
	
func update(delta):
	super.update(delta)
	if Input.is_action_just_pressed("cancel"):
		state_machine.transition_to("ComboPlayerInputState", {"entity": currentEntity})
	elif selection != null and Input.is_action_just_pressed("confirm"):
		print("now we can be done selected")
	elif Input.is_action_just_pressed("up"):
		selection = Symbols.Direction.UP
	elif Input.is_action_just_pressed("down"):
		selection = Symbols.Direction.DOWN
	elif Input.is_action_just_pressed("left"):
		selection = Symbols.Direction.LEFT
	elif Input.is_action_just_pressed("right"):
		selection = Symbols.Direction.RIGHT
