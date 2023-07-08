class_name BattleManager
extends Node

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
	
	for entity in team1.GetEntities():
		entity.TurnDone.connect(HandleEntityTurnDone)
	for entity in team2.GetEntities():
		entity.TurnDone.connect(HandleEntityTurnDone)

func ConstructTurnOrder():
	turnOrder.clear()
	var team1Entities = team1.GetEntities()
	var team2Entities = team2.GetEntities()
	
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
	
	
func HandleEntityTurnDone(entity:Entity):
	print(entity, " done with turn")
	turnIndex+=1
	ProgressTurn()
	
