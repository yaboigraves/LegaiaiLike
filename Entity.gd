class_name Entity
extends Node

signal HealthChanged
signal TurnReady(entity:Entity)
signal TurnDone
signal Died

#these are the current values
@export var speed = 5

var health: int = 10
var ap: int
var isAlive : bool = true



func ApplyActionToSelf(action:Action):
	health -= action.damage
	HealthChanged.emit()
	if health <= 0:
		isAlive = false
		Died.emit()

func DoTurn():
	BattleUIManager.instance.BindEntityToUI(self)
