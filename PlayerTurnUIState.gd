class_name ProcessingPlayerTurn
extends State

var player : PlayerControlledEntity
@export var playerTurnRootDisplay : Control
@export var actionRadial : ActionRadial
@export var comboDisplay : ComboDisplay

func initialize():
	super.initialize()
	PlayerInputHandler.instance.stateMachine.transitioned.connect(HandlePlayerStateChanged)

func enter(_msg := {}) -> void:
	super.enter()
	
	#load the actual player that we're reading from
	player = _msg.player as PlayerControlledEntity;
	



	
	#waiting for the player to mark their actions done or the queue to get updated
	player.TurnReady.connect(HandleTurnReady)
	player.ActionBufferUpdated.connect(HandleActionBufferUpdated)
	
	actionRadial.SetActions(player)

	comboDisplay.ClearComboView()

#	actionRadial.visible = true
#	comboDisplay.visible = true

#holy shit im a genius
#we can totally do this this way wowww
#a state in a state machine, listening to state transitions to handle state
#is this bad??? or genius I cant tell

func HandlePlayerStateChanged(state:State):

	if state is RootPlayerInputState:
		ShowRootDisplay()
	elif state is ComboPlayerInputState:
		ShowComboDisplay()
	elif state is TargettingPlayerInputState:
		ShowTargettingDisplay()
	
	
func ShowRootDisplay():
	playerTurnRootDisplay.visible = true

	actionRadial.visible = false
	comboDisplay.visible = false
	
func ShowComboDisplay():	
	playerTurnRootDisplay.visible = false
	
	actionRadial.visible = true
	comboDisplay.visible = true

func ShowTargettingDisplay():
	actionRadial.visible = false
	
	
func HandleActionBufferUpdated(actionBuffer:ActionBuffer):
	comboDisplay.RefreshComboView(actionBuffer)

func HandleTurnReady(entity):
	#so here we would move to the processing state
	state_machine.transition_to("ProcessingPlayerTurn", {"player": player})

func exit():
	super.exit()
	
	player.TurnReady.disconnect(HandleTurnReady)
	player.ActionBufferUpdated.disconnect(HandleActionBufferUpdated)
	
	actionRadial.visible = false
	comboDisplay.visible = false
