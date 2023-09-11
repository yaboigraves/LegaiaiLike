class_name BattleManager
extends Node


var playerInputHandler : PlayerInputHandler
var turn_order_manager : TurnOrderManager


func _ready() -> void:
	playerInputHandler = $PlayerInputHandler as PlayerInputHandler
	turn_order_manager = $TurnOrderManager as TurnOrderManager
	

	
	turn_order_manager.ConstructTurnOrder()
	
	#tell all the enemys to plan their turns
	#perhaps a team difference is in order idk
	
	
	
	turn_order_manager.DoNextTurn()

func InitializeEnemyActions():
	var enemy_entities : Array[AIControlledEntity] = BattleBlackboard.Instance
	
	

func _on_turn_order_manager_turn_starting(entity) -> void:
	
	var next_state_name = ""
	
	if entity is PlayerControlledEntity:
		next_state_name = "PlayerTurn"
	elif entity is AIControlledEntity:
		next_state_name = "EnemyTurn"
		
	$StateMachine.transition_to(next_state_name, {"entity": entity})

func _on_player_input_handler_got_player_input(input) -> void:
	$StateMachine.HandleInput(input)
