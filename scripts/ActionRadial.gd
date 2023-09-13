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

#ah this is where shit gets fucky
#cause these need to be instantiated

func SetActions(player_controller : PlayerController):
	upActionView.LoadAction(player_controller.entity.up_action)
	leftActionView.LoadAction(player_controller.entity.left_action)
	downActionView.LoadAction(player_controller.entity.down_action)
	rightActionView.LoadAction(player_controller.entity.right_action)
