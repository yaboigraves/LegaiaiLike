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



var turnOrder : Array[Entity]

var team1: Team
var team2: Team
var playerInputHandler : PlayerInputHandler

var turnIndex = 0 

func _ready() -> void:
	CacheTeamRefs()
	
	playerInputHandler = $PlayerInputHandler as PlayerInputHandler
	
	ConstructTurnOrder()
	ProgressTurn()
	
func CacheTeamRefs():
	team1 = $Team1 as Team
	team2 = $Team2 as Team
	team1.TurnDone.connect(HandleEntityTurnDone)
	team2.TurnDone.connect(HandleEntityTurnDone)
	team1.TeamMemberDied.connect(RefreshTurnOrder)
	team2.TeamMemberDied.connect(RefreshTurnOrder)

	team1.Lost.connect(HandleTeamLost)
	team2.Lost.connect(HandleTeamLost)
	


func RefreshTurnOrder(team,entity):
	turnOrder.erase(entity)
	print(turnOrder)

func GetAllAliveEntities() -> Array[Entity]:
	var aliveEnties = team1.GetAliveEntities().duplicate(true)
	aliveEnties.append_array(team2.GetAliveEntities())	
	return aliveEnties
	
func SortEntitiesBySpeed(entity1,entity2):
	return entity1.speed > entity2.speed
#this is for initialization
func ConstructTurnOrder():
	turnOrder.clear()
	
	turnOrder = GetAllAliveEntities()
	turnOrder.sort_custom(SortEntitiesBySpeed)

#	for i in range(max(team1Entities.size(),team2Entities.size())):
#		if team1Entities.size() > i:
#			turnOrder.append(team1Entities[i])
#		if team2Entities.size() > i:
#			turnOrder.append(team2Entities[i])
	
	print(turnOrder)


func ProgressTurn():
	if(turnIndex >= turnOrder.size()):
		turnIndex = 0
	
	
	turnOrder[turnIndex].DoTurn()
	BattleUIManager.instance.DrawTurnOrder(turnOrder,turnIndex)
	
	
func HandleEntityTurnDone(team:Team,entity:Entity):
	print(entity, " done with turn")
	turnIndex+=1
	ProgressTurn()
	
func HandleTeamLost(team:Team):
	print(team, " loses!")
	get_tree().reload_current_scene()
