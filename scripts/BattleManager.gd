class_name BattleManager
extends Node


var playerInputHandler : PlayerInputHandler
var turn_order_manager : TurnOrderManager


#TODO: LEFT OFF HERE 
#Add a blackboard distinction between an enemy team and a player team
#assume there is just one of each of these
#flesh out enemy controlled entities a bit
#get all of the relevant processing stuff into entity
#keep the distinction
#teams are the same no matter what, just groups of entities

#so yeah, move stuff up from player controlled to entity base
#only real distinction is that players can "Attempt" to add stuff
#AI will calculate stuff on the fly I suppose
#actually no
#just give AI like gimmicks like fen said
#so build out combos for them as their own struct I guess
#actions are scenes, so just make an enemy turn that uses these per entity
#then assign them
#ai controlled entities just choose one based on scenario



func _ready() -> void:
	playerInputHandler = $PlayerInputHandler as PlayerInputHandler
	turn_order_manager = $TurnOrderManager as TurnOrderManager

	turn_order_manager.ConstructTurnOrder()
	
	turn_order_manager.DoNextTurn()
		
		

func _on_turn_order_manager_turn_starting(entity) -> void:
	if entity is PlayerControlledEntity:
		$StateMachine.transition_to("PlayerTurn", {"entity": entity})
	elif entity is AIControlledEntity:
		pass


func _on_player_input_handler_got_player_input(input) -> void:
	$StateMachine.HandleInput(input)
