class_name EnemyActionDisplay
extends Control


func ShowAction(action:Action):
	$ActionName.text = "[center]" + action.actionName
