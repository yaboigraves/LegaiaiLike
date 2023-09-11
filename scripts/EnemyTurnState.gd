class_name EnemyTurnState
extends State

var entity: AIControlledEntity

func enter(args = {}):
	super.enter(args)
	entity = args.entity
	
	print("Ok Lets do this guys turn")
	#basically we should already know what we're doing
