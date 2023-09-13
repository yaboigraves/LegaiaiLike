class_name Team
extends Node

@export_enum("PLAYER","ENEMY") var team_type

@export var entities_data : Array[EntityData]
@export var entity_packed_scene:PackedScene
@export var max_entities : int = 3

var active_entities : Array[EntityController]

signal Lost(team:Team)
signal TeamMemberDied(team:Team, entity:Entity)
signal TurnDone(team:Team, entity:Entity)
signal EntitiesUpdated




func _ready() -> void:

	InstantiateEntities()
	

func InstantiateEntities():
	for i in range(max_entities):
		if i >= entities_data.size(): break
		
		var controller : EntityController

		
		if team_type == 0:
			controller = PlayerController.new(entities_data[i])
		elif team_type == 1:
			controller = AIController.new(entities_data[i])
		
		active_entities.append(controller)
		
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
	

func GetEntities() -> Array[EntityController]:
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
