class_name AIControlledEntity
extends Entity


func DoTurn():

	
	#figure out action and target
	#...
	
	#pass off the processed stuff to the ui with a signal
	super.DoTurn()

	print("")
	TurnReady.emit()
	#TurnDone.emit(self)
