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
var speed = 5
var maxHealth : int = 10
var health: int = 10
var ap: int

var isAlive : bool = true


func _ready() -> void:

	BattleBlackboard.Instance.entities.append(self)
	
	self.maxHealth = entityData.maxHealth
	self.health = maxHealth
	self.ap = entityData.ap
	self.speed = entityData.speed

#REMOVE
func ApplyActionToSelf(action:Action):
	health -= action.damage
	HealthChanged.emit()
	if health <= 0:
		isAlive = false
		Died.emit(self)
		print(self, " died!")

func DoTurn():
	
	#so battle manager is actually going to listen for this
	#an entites turn starting means we move the state machine into a players turn
	#or maybe actually the entity just gets told its turn starts
	#that kinda makes more sense
	#so the turn order scheduler actually tells the battle manager hey its this things turn
	
	Messenger.EntityTurnStarted.emit(self)
	
	#not necessary because we should be listening to messenger
	#BattleUIManager.instanceB.BindEntityToUI(self)	
	pass
