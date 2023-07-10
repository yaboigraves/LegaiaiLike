class_name Team
extends Node

signal Lost(team:Team)
signal TeamMemberDied(team:Team, entity:Entity)
signal TurnDone(team:Team, entity:Entity)

@export var enemyTeam: Team

func _ready() -> void:
	for entity in GetEntities():
		entity.TurnReady.connect(HandleEntityTurnReady)
		entity.TurnDone.connect(HandleEntityTurnDone)
		entity.Died.connect(HandleEntityDied)


func HandleEntityTurnReady(entity:Entity):

	
	if entity is AIControlledEntity:
		var randomTarget = enemyTeam.GetAliveEntities().pick_random()
		randomTarget.ApplyActionToSelf(entity.selectedAction)
	
	if entity is PlayerControlledEntity:
		var testTarget = enemyTeam.GetEntities()[0]
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


func GetAliveEntities():
	var entities : Array[Entity]
	for child in get_children():
		if child.isAlive:
			entities.append(child)
	return entities


func HandleEntityDied(entity:Entity):
	if IsLoseConditonMet():
		Lost.emit(self)
	else:
		TeamMemberDied.emit(self,entity)

func HandleEntityTurnDone(entity:Entity):
	TurnDone.emit(self,entity)
