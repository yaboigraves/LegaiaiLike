class_name ProcessingPlayerTurn
extends State

@export var actionRadial : ActionRadial
@export var comboDisplay : ComboDisplay

func enter(_msg := {}) -> void:
	super.enter()
	
	#load the actual player that we're reading from
	var player = _msg.player;
	actionRadial.visible = true
	comboDisplay.visible = true

func exit():
	super.exit()
	actionRadial.visible = false
	comboDisplay.visible = false
