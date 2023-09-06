class_name BattleUIManager
extends Node

#note MAKE SURE THIS IS HIGH IN THE INIT ORDER SO TEAMS AND STUFF DONT GET BUILT OUT
#this can basically get completly remade
#well actually
#they just need some renaming
#so I guess start by basically just grabbing this scene setup 
#we really want to move through the state machine like screens
#so we just look at the messenger and react to the events by moving to a dif screen


static var instance : BattleUIManager
var stateMachine : StateMachine

func _init():
	super._init()
	instance = self

func _ready() -> void:
	Messenger.TurnOrderUpdated.connect(DrawTurnOrder)
	Messenger.EntityTurnStarted.connect(BindEntityToUI)
	
	
func BindEntityToUI(entity: Entity):
	if entity is PlayerControlledEntity:
		$StateMachine.transition_to("PlayerTurn",{"player" : entity as PlayerControlledEntity})
	
	elif entity is AIControlledEntity:
		$StateMachine.transition_to("EnemyTurn",{"enemy" : entity as AIControlledEntity})


func DrawTurnOrder(turnOrder, index):
	$TurnOrderDisplay.RefreshTurnOrder(turnOrder,index)
