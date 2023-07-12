class_name BattleManager
extends Node

#cool so thats working
#we reaaaally need some kind of way to differentiate between people now
#so lets give entities a resource for who's loaded into them basically?

#my gut says that the player input stuff is actually kind of bad
#I think what I want is like, a state machine that mirrors another state machine?

#kinda weird but i guess its fine as is actually

#team uis and entity us needs a facelift though
#I think, teams ough to be more generally acessible?
#lets first worry directly about state info transferring
#I think there ought to basically be a ui that teams fill out whenever teams change

#ok so maybe we just ought to like, bind to teams via an int or something
#basically UI can just be registered with one of the teams via a static singleton
#they can just be like "hey, im on team 2, let me sign up to listen for team 2s events"

#ex
#team display : can just sub to when the teams slots get updated, can sub to when individual entities get selected
#that seems best, so we inject d

#well actually
#maybe we bake this into a base class for UI states/components
#i think theres a decent case for making game state a singleton
#yeah theres just like, too many veird variables to worry about
#I guess basically, we just need to listen to teams for when we do team stuff
#the core idea of this UI i think, is to simply observe events we get from game state

#I think alot of the UI can be simplified if we just have whatever team we're supposed to follow setup
#the gameplay logic should be just that, gameplay logic, literal rules
#the ui can then follow that

#but ui dictates some gameplay
#the two are mixed
#hmmmm
#now would be the time to refactor this to get this last feature in
#its apparent what the system needs

#soooo
#I dont really like this



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
