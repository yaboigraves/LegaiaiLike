class_name EnemyTurnState
extends State

var entity: AIController

func enter(args = {}):
	super.enter(args)
	entity = args.entity
	
	print("Ok Lets do this guys turn")
	
	
	
	#basically we should already know what we're doing
	#so to start we basically just take the action and go?
	#get the modifuier, apply it
	
	var effect_modifiers : Array[EffectModifier] = entity.next_action.CompileEffects(entity.next_targets[0])
