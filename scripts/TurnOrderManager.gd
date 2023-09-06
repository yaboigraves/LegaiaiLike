class_name TurnOrderManager
extends Node

var turn_order : Array[Entity]
var turn_index : int = 0

func ConstructTurnOrder():
	turn_order = BattleBlackboard.Instance.GetAllAliveEntities()
	turn_order.sort_custom(SortEntitiesBySpeed)
	
func SortEntitiesBySpeed(entity1,entity2):
	return entity1.speed > entity2.speed
	
func DoNextTurn():
	if(turn_index >= turn_order.size()):
		turn_index = 0
	
	#it is being told to do its turn though which is good
	turn_order[turn_index].DoTurn()
	
	Messenger.TurnOrderUpdated.emit(turn_order, turn_index)
	
	#TODO: move this to just listen to a messenger event
#	BattleUIManager.instance.DrawTurnOrder(turn_order,turn_index)
	
