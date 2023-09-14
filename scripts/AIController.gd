class_name AIController
extends EntityController

var next_action: Action
var next_targets: Array[EntityController]

func CreateNewTurn(): 
	next_action = entity_data.actions[0].instantiate()
	add_child(next_action)

	
	#get a random enemy unit
	
	next_targets = [BattleBlackboard.Instance.GetRandomOtherTeam(self)]
	entity.hud.ShowNextAction(next_action)
