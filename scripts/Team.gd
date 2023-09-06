class_name Team
extends Node

signal Lost(team:Team)
signal TeamMemberDied(team:Team, entity:Entity)
signal TurnDone(team:Team, entity:Entity)
signal EntitiesUpdated

#marking enemy team here is kinda weird
#i dont really like it 
#I think actions will have some parameters for targetting
#and that will use the caster to find the enemy team
#rather than caching  it

@export var enemyTeam: Team

func _ready() -> void:
	BattleBlackboard.Instance.teams.append(self)
	
	for entity in GetEntities():
		entity.TurnReady.connect(HandleEntityTurnReady)
		entity.TurnDone.connect(HandleEntityTurnDone)
		entity.Died.connect(HandleEntityDied)
	
	EntitiesUpdated.emit()

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
