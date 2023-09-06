class_name BattleManager
extends Node

#so porting is cancelled till we make this fun
#right now its a little boring, and too easy
#so first thing we want to do is add in affinities
#each combo can do affinity damage in addition to normal
#enemies are weak/resistant to some affinities
#affinity use moves the battle vibe
#battle vibe changes quite a lot, but in layers
#lets start with layer 1 which is just a passive effect for each quadrant

#TODO: refactor actions to be based on modular effects
#TODO: get affinities setup
#TODO: get affinity battle mods setup
#TODO: make it so you can target team mates too with stuff

#ok lets start with the turn order refactor as well
#yeah so the turn order thingy dispatches control out to units

#move this later
var turnOrder : Array[Entity]

var team1: Team
var team2: Team
var playerInputHandler : PlayerInputHandler
var turn_order_manager : TurnOrderManager

var turnIndex = 0 

#get the turn order manager


func _ready() -> void:
	#CacheTeamRefs()
	
	playerInputHandler = $PlayerInputHandler as PlayerInputHandler
	turn_order_manager = $TurnOrderManager as TurnOrderManager
	
	turn_order_manager.ConstructTurnOrder()
	turn_order_manager.DoNextTurn()
	
	
#so this responsibility goes out to the blackboard
#To cache these refs
#I might actually be using the blackboard wrong?
#nah it seems right
#shared space for information for entities
#entities need to access all other entities, and the current board state
#effects need to be able to that is I suppose
#targetting will use it too
#its where the actual mapping of entities to their active slots occurs

#so these refs that get cahced really ought to be part of the blackboard

#so teams are persistent



#func CacheTeamRefs():
#	team1 = $Team1 as Team
#	team2 = $Team2 as Team
#	team1.TurnDone.connect(HandleEntityTurnDone)
#	team2.TurnDone.connect(HandleEntityTurnDone)
#
#	team1.TeamMemberDied.connect(RefreshTurnOrder)
#	team2.TeamMemberDied.connect(RefreshTurnOrder)
#
#	team1.Lost.connect(HandleTeamLost)
#	team2.Lost.connect(HandleTeamLost)
#

#func RefreshTurnOrder(team,entity):
#	turnOrder.erase(entity)
#	print(turnOrder)

#func GetAllAliveEntities() -> Array[Entity]:
#	var aliveEnties = team1.GetAliveEntities().duplicate(true)
#	aliveEnties.append_array(team2.GetAliveEntities())	
#	return aliveEnties
	

#so a messaging system is actually probably wise too
#so when any entity is done with its turn it can just say my turn is done
#so lets build the messenger, which for now is just a singleton place to sub to events and trigger events



#
#func HandleEntityTurnDone(team:Team,entity:Entity):
#	print(entity, " done with turn")
#	turnIndex+=1
#	#ProgressTurn()
#
#func HandleTeamLost(team:Team):
#	print(team, " loses!")
#	get_tree().reload_current_scene()

#check the entity type here? nah in turn order thing


func _on_turn_order_manager_turn_starting(entity) -> void:
	if entity is PlayerControlledEntity:
		$StateMachine.transition_to("PlayerTurn", {"entity": entity})
	elif entity is AIControlledEntity:
		pass


func _on_player_input_handler_got_player_input(input) -> void:
	$StateMachine.HandleInput(input)
