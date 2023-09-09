class_name BattleManager
extends Node


var playerInputHandler : PlayerInputHandler
var turn_order_manager : TurnOrderManager


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
