class_name ProcessingComboPlayerInputState
extends PlayerInputState

var action_buffer : ActionBuffer 

func enter(args={}):
	super.enter(args)
	
	
	#so yeah what do I want to write here
	#iterate over the modifiers in the array
	#do them if we need to
	#so x2 can modify the next effect
	#we can pre-process any extra stuff here
	#leave it here though
	
	
	#get the stack from the current entity
	action_buffer = current_entity.actionBuffer

	#so the action buffer actually knows what the heck is going on
	
	for target in action_buffer.targets:
		var modifiers = action_buffer.target_modifier_map[target]
		print(modifiers)
