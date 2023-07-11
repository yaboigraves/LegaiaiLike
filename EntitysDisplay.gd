class_name EntitysDisplay
extends Control


var entity: Entity

var icons 

	
	
func LoadTeam(team:Team):
	icons = $VBoxContainer.get_children() 
	var i = 0
	for entity in team.GetEntities():
		icons[i].LoadEntity(entity)
		i+= 1

