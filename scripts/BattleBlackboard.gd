class_name BattleBlackboard
extends Node

#TODO: make this an autoload

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

#get the enemy teams targets
func GetEnemyTeamMembersByEntity(entity:Entity):
	var enemy_teams : Array[Team]= []
	for team in teams:
		if not team.GetEntities().has(entity):
			enemy_teams.append(team)

	var enemies : Array[Entity]
	for team in enemy_teams:
		enemies.append_array(team.GetEntities())
	return enemies
