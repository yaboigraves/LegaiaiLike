class_name Team
extends Node

@export var entities_data : Array[EntityData]
@export var entity_packed_scene:PackedScene
@export var max_entities : int = 3

var active_entities : Array[Entity]

signal Lost(team:Team)
signal TeamMemberDied(team:Team, entity:Entity)
signal TurnDone(team:Team, entity:Entity)
signal EntitiesUpdated




func _ready() -> void:
	BattleBlackboard.Instance.teams.append(self)
	InstantiateEntities()
	

func InstantiateEntities():
	for i in range(max_entities):
		
		if i >= entities_data.size(): break
		
		var entity:Entity = entity_packed_scene.instantiate()
		entity.SetEntityData(entities_data[i])
		
		active_entities.append(entity)

	$EntitysDisplay.LoadTeam(active_entities)



func IsLoseConditonMet() -> bool:
	var entities = GetEntities()
	for entity in entities:
		if entity.health > 0:
			return false
	return true
	
func IsEntityAtIndexAlive(index):
	return (get_child(index) as Entity).isAlive
	
func GetEntityAtIndex(index) -> Entity:
	return get_child(index) as Entity
	

func GetEntities() -> Array[Entity]:
	return active_entities


func GetAliveEntities():
	var alive_entities : Array[Entity]
	for child in active_entities:
		if child.isAlive:
			alive_entities.append(child)
	return alive_entities


func HandleEntityDied(entity:Entity):
	if IsLoseConditonMet():
		Lost.emit(self)
	else:
		TeamMemberDied.emit(self,entity)

func HandleEntityTurnDone(entity:Entity):
	TurnDone.emit(self,entity)
