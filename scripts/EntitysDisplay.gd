class_name EntitysDisplay
extends Node2D


@export var team : Team
var icons 

func LoadTeam(entities: Array[Entity]):
	for i in range(entities.size()):
		get_child(i).add_child(entities[i])
