class_name Entity
extends Node2D


#so now we're getting into it
#move the player specific action buffer stuff into the player controller

var hud : EntityHud

signal HealthChanged
signal TurnStarted
signal TurnReady(entity:Entity)
signal TurnDone(entity:Entity)
signal Died(entity:Entity)
signal Targeted
signal Untargeted


signal ActionBufferUpdated
signal TargetChanged(target: Entity)



var actionBuffer : ActionBuffer
#these are the current values
@export var entity_data : EntityData
var speed = 5
var maxHealth : int = 10

var health: int = 10
		
var ap: int

var isAlive : bool = true


var up_action: Action
var down_action: Action
var left_action: Action
var right_action: Action

var team: Team


func _ready() -> void:

	self.maxHealth = entity_data.maxHealth
	self.health = maxHealth
	self.ap = entity_data.ap
	self.speed = entity_data.speed
	
	hud = $HUD as EntityHud
	#hud.UpdateHealth(health,maxHealth)

func SetEntityData(entity_data:EntityData):
	self.entity_data = entity_data
	
	if entity_data is PlayerControlledEntityData:
		print("player")
		#initialize the weapons and abilities and whatnot
		SpawnPlayerActions()
	elif entity_data is AIControlledentityData:
		print("enemy")
		#setup the actions


func SpawnPlayerActions():
	up_action = entity_data.upAction.instantiate()
	down_action = entity_data.downAction.instantiate()
	left_action = entity_data.leftAction.instantiate()
	right_action = entity_data.rightAction.instantiate()
	add_child(up_action)
	add_child(down_action)
	add_child(left_action)
	add_child(right_action)
	
	
	
func ProcessActionBuffer():
	actionBuffer.CompileActions()

#func SetTurnTargets(targets: Array[EntityController]):
#	actionBuffer.SetTargets(targets)

func CreateNewTurn():
	Messenger.EntityTurnStarted.emit(self)
	actionBuffer = ActionBuffer.new(ap)
	
func ApplyDamageModifier(damage_modifier: DamageModifier):
	self.health -= damage_modifier.value
	hud.UpdateHealth(health,maxHealth)
	HealthChanged.emit()
	if health <= 0:
		isAlive = false
		Died.emit(self)
		print(self, " died!")
	
	print(self.health)


func TryAddDirectionToCombo(direction : Symbols.Direction) -> bool:
	match(direction):
		Symbols.Direction.UP:
			return actionBuffer.TryAddAction(up_action)
		Symbols.Direction.DOWN:
			return actionBuffer.TryAddAction(down_action)
		Symbols.Direction.LEFT:
			return actionBuffer.TryAddAction(left_action)
		Symbols.Direction.RIGHT:
			return actionBuffer.TryAddAction(right_action)
		
	return false

