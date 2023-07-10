class_name BattleManager
extends Node

#cool so thats working
#we reaaaally need some kind of way to differentiate between people now
#so lets give entities a resource for who's loaded into them basically?

var turnOrder : Array[Entity]

var team1: Team
var team2: Team

var turnIndex = 0 

func _ready() -> void:
	CacheTeamRefs()
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
	
#this is for initialization
func ConstructTurnOrder():
	turnOrder.clear()
	var team1Entities = team1.GetAliveEntities()
	var team2Entities = team2.GetAliveEntities()
	
	for i in range(max(team1Entities.size(),team2Entities.size())):
		if team1Entities.size() > i:
			turnOrder.append(team1Entities[i])
		if team2Entities.size() > i:
			turnOrder.append(team2Entities[i])
	
	print(turnOrder)


func ProgressTurn():
	if(turnIndex >= turnOrder.size()):
		turnIndex = 0
	
	print("starting ", turnOrder[turnIndex], " turn")
	turnOrder[turnIndex].DoTurn()
	
	BattleUIManager.instance.DrawTurnOrder(turnOrder,turnIndex)
	
	
func HandleEntityTurnDone(team:Team,entity:Entity):
	print(entity, " done with turn")
	turnIndex+=1
	ProgressTurn()
	
func HandleTeamLost(team:Team):
	print(team, " loses!")
	get_tree().reload_current_scene()
