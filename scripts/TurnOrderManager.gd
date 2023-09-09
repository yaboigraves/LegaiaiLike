class_name TurnOrderManager
extends Node

signal TurnStarting(entity:Entity)

var turn_order : Array[Entity]
var turn_index : int = 0

func _ready() -> void:
	Messenger.EntityTurnDone.connect(HandleEntityTurnDone)

func ConstructTurnOrder():
	turn_order = BattleBlackboard.Instance.GetAllAliveEntities()
	turn_order.sort_custom(SortEntitiesBySpeed)
	
func SortEntitiesBySpeed(entity1,entity2):
	return entity1.speed > entity2.speed
	
func DoNextTurn():
	if(turn_index >= turn_order.size()):
		turn_index = 0
	
	TurnStarting.emit(turn_order[turn_index])
	Messenger.TurnOrderUpdated.emit(turn_order, turn_index)

func HandleEntityTurnDone(entity : Entity):
	turn_index += 1
	DoNextTurn()
