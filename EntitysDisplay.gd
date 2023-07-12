class_name EntitysDisplay
extends Control


#so the team gets subbed to here
#really all this should do is dispense the injection to the sub guys and turn on and off
#for now at least?
#maybe it literally doesnt need to exist actually
#nah if people change later it will do more

@export var team : Team

var icons 


func _ready() -> void:
	team.EntitiesUpdated.connect(HandleEntitiesUpdated)

func HandleEntitiesUpdated():
	LoadTeam()
	
func LoadTeam():
	icons = $VBoxContainer.get_children() 
	var i = 0
	for entity in team.GetEntities():
		icons[i].LoadEntity(entity)
		i+= 1

