class_name ComboDisplay
extends Control

@export var actionViewScene : PackedScene

func ClearComboView():
	for child in $HBoxContainer.get_children():
		$HBoxContainer.remove_child(child)
		child.queue_free()

func RefreshComboView(actionBuffer:ActionBuffer):
	
	ClearComboView()
	for action in actionBuffer.actions: 
		var actionView:ActionView = actionViewScene.instantiate() as ActionView
		actionView.LoadAction(action)
		$HBoxContainer.add_child(actionView)
		
