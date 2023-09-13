class_name BattleBlackboard
extends Node

#TODO: make this an autoload

static var Instance : BattleBlackboard

#agghhh this layer is really gonna muck shit up
#is it needed? probably yeah
#entities should really just be data controllers
#if you want to operate on an entity, operate on the controller
#entities store data, and update UI's



@export var player_team: Team
@export var enemy_team: Team

var entity_controllers: Array[EntityController]

var vibe_position : Vector2i

func _init() -> void:
	Instance = self

	vibe_position = Vector2i.ZERO

func GetAllAliveEntities() -> Array[EntityController]:
	var alive_entities : Array[EntityController] = []

	for entity_controller in entity_controllers:
		if entity_controller.IsAlive(): alive_entities.append(entity_controller)

	return alive_entities

#get the enemy teams targets
func GetEnemyTeamMembersByEntity(entity:EntityController):
	
	if enemy_team.active_entities.has(entity):
		return player_team.active_entities
	else:
		return enemy_team.active_entities
	
#	var enemy_teams : Array[Team]= []
#	for team in teams:
#		if not team.GetEntities().has(entity):
#			enemy_teams.append(team)
#
#	var enemies : Array[Entity]
#	for team in enemy_teams:
#		enemies.append_array(team.GetEntities())
#	return enemies

func RegisterEntityController(entity_controller: EntityController):
	entity_controllers.append(entity_controller)

func ModifyVibe(vibe_delta):
	vibe_position += vibe_delta
	
