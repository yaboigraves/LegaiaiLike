class_name Entity
extends Node

signal TurnReady
signal TurnDone


#these are the current values
var health: int
var ap: int





func DoTurn():
	BattleUIManager.instance.BindEntityToUI(self)
