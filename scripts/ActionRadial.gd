class_name ActionRadial
extends Control

var upActionView : ActionView
var leftActionView : ActionView
var downActionView : ActionView
var rightActionView : ActionView

func _ready() -> void:
	CacheActionViews()
	
func CacheActionViews():
	upActionView = $VBoxContainer/UpAction as ActionView
	leftActionView = $VBoxContainer/LeftAction as ActionView
	downActionView = $VBoxContainer/DownAction as ActionView
	rightActionView = $VBoxContainer/RightAction as ActionView

func SetActions(entity : PlayerControlledEntity):
	upActionView.LoadAction(entity.upAction)
	leftActionView.LoadAction(entity.leftAction)
	downActionView.LoadAction(entity.downAction)
	rightActionView.LoadAction(entity.rightAction)
