class_name BattleBlackboard
extends Node

static var Instance : BattleBlackboard

var teams : Array[Team]
var entities: Array[Entity]

func _init() -> void:
	Instance = self

func GetAllAliveEntities() -> Array[Entity]:
	var alive_entities : Array[Entity] = []
	
	for entity in entities:
		if entity.isAlive: alive_entities.append(entity)
	
	return alive_entities
	

