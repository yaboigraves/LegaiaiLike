class_name BattleManager
extends Node

#alright lets go for a quick walk and think a bit


var playerInputHandler : PlayerInputHandler
var turn_order_manager : TurnOrderManager


#alrighty
#we need some fucking UI back
#so lets go with health bars above entities to start



func _ready() -> void:
	playerInputHandler = $PlayerInputHandler as PlayerInputHandler
	turn_order_manager = $TurnOrderManager as TurnOrderManager

	turn_order_manager.ConstructTurnOrder()
	
	turn_order_manager.DoNextTurn()
		
		

func _on_turn_order_manager_turn_starting(entity) -> void:
	
	#so this distinction can't be made anymore
	#so maybe here's an idea
	#seperate out the entity as a base value
	#instantiate a child value that's the actual brain of the enitity
	#entity just listens to that thing
	#controllers basically
	#so entities are controlled by playercontrollers or AI controllers
	#these get spawned dynamically based on data 
	#they can be activated to route input to something other than the entity as well
	#or other way around
	#ya know what hmmm
	#perhaps the base is the actual interface
	#so using the data we spawn one of the kind of base classes
	#these will create the actual entity
	#so actors will spawn entities that they steer
	#that sounds good
	#these things are basically like, control layers
	
	#alright SO
	#entities are unique
	#lets get started
	#so teams will need refs to their controller they use to spawn
	#controllrs are just initialized by a field in the top
	
	
	if entity is PlayerController:
		$StateMachine.transition_to("PlayerTurn", {"entity": entity})
	elif entity is AIController:
		print("enemy turn time!!!")


func _on_player_input_handler_got_player_input(input) -> void:
	$StateMachine.HandleInput(input)
