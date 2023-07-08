class_name ProcessingPlayerTurn
extends State

var player : PlayerControlledEntity
@export var actionRadial : ActionRadial

@export var comboDisplay : ComboDisplay

func enter(_msg := {}) -> void:
	super.enter()
	
	#load the actual player that we're reading from
	player = _msg.player as PlayerControlledEntity;
	actionRadial.visible = true
	comboDisplay.visible = true
	
	#waiting for the player to mark their actions done or the queue to get updated
	player.TurnReady.connect(HandleTurnReady)
	player.ActionBufferUpdated.connect(HandleActionBufferUpdated)
	
	actionRadial.SetActions(player)

	comboDisplay.ClearComboView()


func HandleActionBufferUpdated(actionBuffer:ActionBuffer):
	comboDisplay.RefreshComboView(actionBuffer)

func HandleTurnReady():
	#so here we would move to the processing state
	state_machine.transition_to("ProcessingPlayerTurn", {"player": player})

func exit():
	super.exit()
	
	player.TurnReady.disconnect(HandleTurnReady)
	player.ActionBufferUpdated.disconnect(HandleActionBufferUpdated)
	
	actionRadial.visible = false
	comboDisplay.visible = false
