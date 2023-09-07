class_name Entity
extends Node2D



signal HealthChanged
signal TurnStarted
signal TurnReady(entity:Entity)
signal TurnDone(entity:Entity)
signal Died(entity:Entity)
signal Targeted
signal Untargeted



#these are the current values
@export var entity_data : EntityData
var speed = 5
var maxHealth : int = 10
var health: int = 10
var ap: int

var isAlive : bool = true


func _ready() -> void:

	BattleBlackboard.Instance.entities.append(self)
	
	self.maxHealth = entity_data.maxHealth
	self.health = maxHealth
	self.ap = entity_data.ap
	self.speed = entity_data.speed

#REMOVE
func ApplyActionToSelf(action:Action):
	health -= action.damage
	HealthChanged.emit()
	if health <= 0:
		isAlive = false
		Died.emit(self)
		print(self, " died!")


func SetEntityData(entity_data:EntityData):
	self.entity_data = entity_data
	

func CreateNewTurn():
	Messenger.EntityTurnStarted.emit(self)
	
