extends Control

@export var entityIcon : PackedScene


#it loops kinda right now so lets be simple?
#draw a certain number and just loop through the turn order I guess?

#so really what we want to do is start at turn index, and keep drawing with like a while loop


func RefreshTurnOrder(turnOrder: Array[Entity], turnIndex: int):
	ClearTurnOrder()
	
	var iconsLeft = turnOrder.size()
	var i = turnIndex
	while iconsLeft > 0:
		var iconInstance = entityIcon.instantiate()
		if i >= turnOrder.size():
			i = 0
			
		if turnOrder[i] is AIControlledEntity:
			iconInstance.modulate = Color.INDIAN_RED
		else:
			iconInstance.modulate = Color.SKY_BLUE
			
		iconInstance.texture = turnOrder[i].entityData.icon
		$HBoxContainer.add_child(iconInstance)
		
		
		
		i += 1
		iconsLeft-= 1
	
#	for entity in turnOrder:
#		var iconInstance = entityIcon.instantiate()
#		iconInstance.texture = entity.entityData.icon
#		$HBoxContainer.add_child(iconInstance)
	

func ClearTurnOrder():
	for child in $HBoxContainer.get_children():
		child.queue_free()
		$HBoxContainer.remove_child(child)
