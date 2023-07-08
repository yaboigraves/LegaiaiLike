class_name ComboDisplay
extends Control

@export var actionViewScene : PackedScene

func RefreshComboView(actionBuffer:ActionBuffer):
	for child in $HBoxContainer.get_children():
		$HBoxContainer.remove_child(child)
		child.queue_free()
	
	for action in actionBuffer.actions: 
		var actionView:ActionView = actionViewScene.instantiate() as ActionView
		actionView.LoadAction(action)
		$HBoxContainer.add_child(actionView)
		
