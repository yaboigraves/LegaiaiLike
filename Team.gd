class_name Team
extends Node

@export var enemyTeam: Team

func _ready() -> void:
	for entity in GetEntities():
		entity.TurnReady.connect(HandleEntityTurnReady)


func HandleEntityTurnReady(entity:Entity):
	var testTarget = enemyTeam.GetEntities()[0]
	
	if entity is AIControlledEntity:
		pass
	
	if entity is PlayerControlledEntity:
		for action in entity.actionBuffer.actions:
			testTarget.ApplyActionToSelf(action)
	


func IsLoseConditonMet() -> bool:
	var entities = GetEntities()
	for entity in entities:
		if entity.health > 0:
			return false
	return true
	
	
func GetEntities() -> Array[Entity]:
	var entities : Array[Entity]
	
	for child in get_children():
		entities.append(child as Entity)
	
	return entities

