class_name ProcessingPlayerTurn
extends State

var player : PlayerControlledEntity
@export var playerTurnRootDisplay : Control
@export var actionRadial : ActionRadial
@export var comboDisplay : ComboDisplay

func initialize():
	super.initialize()
	#yeah like what is this garbage lol
	
	#PlayerInputHandler.instance.stateMachine.transitioned.connect(HandlePlayerStateChanged)

func enter(_msg := {}) -> void:
	super.enter()
	
	#load the actual player that we're reading from
	player = _msg.player as PlayerControlledEntity;

	#waiting for the player to mark their actions done or the queue to get updated
	player.TurnReady.connect(HandleTurnReady)
	player.ActionBufferUpdated.connect(HandleActionBufferUpdated)
	player.TargetChanged.connect(HandleTargetChanged)
	
	actionRadial.SetActions(player)

	comboDisplay.ClearComboView()
	
	ShowRootDisplay()



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

func HandleTargetChanged(target: Entity):
	print("target is ", target)

func exit():
	super.exit()
	
	#we listen directly to the player
	#which is kind of silly
	#UI can just bind to the messenger
	
	#I like that better rather than juggling a player ref
	
	player.TurnReady.disconnect(HandleTurnReady)
	player.ActionBufferUpdated.disconnect(HandleActionBufferUpdated)
	player.TargetChanged.disconnect(HandleTargetChanged)

	actionRadial.visible = false
	comboDisplay.visible = false
