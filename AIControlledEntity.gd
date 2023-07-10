class_name AIControlledEntity
extends Entity

#TODO: we can add basic AI code here for rules they follow, for now lets just give them a bank of actions

@export var actions: Array[Action]
var selectedAction : Action

func DoTurn():

	
	#figure out action and target
	#...
	selectedAction = actions[0]
	#pass off the processed stuff to the ui with a signal
	super.DoTurn()


	print("enemy doing action ", actions[0])
	TurnReady.emit(self)

