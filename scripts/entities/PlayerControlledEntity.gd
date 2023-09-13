class_name PlayerControlledEntity
extends Entity

#ok so read this from data

#var upAction: Action
#var downAction : Action
#var leftAction: Action
#var rightAction : Action



func _ready() -> void:
	super._ready()

#ah so this wait
func SetEntityData(entity_data:EntityData):
	super.SetEntityData(entity_data)
#	if entity_data.upAction:
#		upAction = entity_data.upAction.instantiate()
#		add_child(upAction)
#	if entity_data.leftAction:
#		leftAction = entity_data.leftAction.instantiate()
#		add_child(leftAction)
#	if entity_data.downAction:
#		downAction = entity_data.downAction.instantiate()
#		add_child(downAction)
#	if entity_data.rightAction:
#		rightAction = entity_data.rightAction.instantiate()
#		add_child(rightAction)



	

