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

#marking enemy team here is kinda weird
#i dont really like it 
#I think actions will have some parameters for targetting
#and that will use the caster to find the enemy team
#rather than caching  it
#to start, we want to look at the entity datas we want to spawn
#we spawn an entity for each of these
#we also want to track positions for these entities
#along with sprites


#TODO: spawn in our entities!
#ok lets tackle entity spawning
#some mobs, might spawn enemies
#allies might join fights

#so to start we want to spawn in all the entities in the actual slots
#the slots is an INTERNAL array that we use 
#we want to keep a max size on these which can be an exported field


@export var enemyTeam: Team

func _ready() -> void:
	BattleBlackboard.Instance.teams.append(self)
	
	InstantiateEntities()
	
	#break time then pick up here
	#drink some water go walk do something then tackle the rest of this
	#remember, visuals are very temp rn
	#dont stress too much on this
	
	
	
#	for entity in GetEntities():
#		entity.TurnReady.connect(HandleEntityTurnReady)
#		entity.TurnDone.connect(HandleEntityTurnDone)
#		entity.Died.connect(HandleEntityDied)
#
#	EntitiesUpdated.emit()


func InstantiateEntities():
	for i in range(max_entities):
		
		if i >= entities_data.size(): break
		
		var entity:Entity = entity_packed_scene.instantiate()
		entity.SetEntityData(entities_data[i])
		
		active_entities.append(entity)

	$EntitysDisplay.LoadTeam(active_entities)

func HandleEntityTurnReady(entity:Entity):
	if entity is AIControlledEntity:
		var randomTarget = enemyTeam.GetAliveEntities().pick_random()
		randomTarget.ApplyActionToSelf(entity.selectedAction)
	
	if entity is PlayerControlledEntity:
		
		#technically you should be able to target your allies too ngl
		#lets fix that later
		var testTarget = entity.actionBuffer.target
		
		for action in entity.actionBuffer.actions:
			#testTarget.ApplyActionToSelf(action)
			print("Trying to do  thing")


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
