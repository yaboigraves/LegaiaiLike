class_name BattleBlackboard
extends Node

#TODO: make this an autoload

static var Instance : BattleBlackboard

#so make a discrete variable for this
var teams : Array[Team]
var entities: Array[Entity]

var vibe_position : Vector2i



func _init() -> void:
	Instance = self
	
	vibe_position = Vector2i.ZERO

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


func ModifyVibe(vibe_delta):
	vibe_position += vibe_delta
	
