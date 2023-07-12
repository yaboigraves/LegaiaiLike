class_name Entity
extends Node

signal HealthChanged
signal TurnStarted
signal TurnReady(entity:Entity)
signal TurnDone(entity:Entity)
signal Died(entity:Entity)
signal Targeted
signal Untargeted



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
		print(self, " died!")

func DoTurn():
	BattleUIManager.instance.BindEntityToUI(self)
