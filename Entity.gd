class_name Entity
extends Node

signal HealthChanged
signal TurnReady(entity:Entity)
signal TurnDone
signal Died(entity:Entity)

#these are the current values
@export var entityData : EntityData
@export var speed = 5

var health: int = 10
var ap: int
var isAlive : bool = true



func ApplyActionToSelf(action:Action):
	health -= action.damage
	HealthChanged.emit()
	if health <= 0:
		isAlive = false
		Died.emit(self)

func DoTurn():
	BattleUIManager.instance.BindEntityToUI(self)
