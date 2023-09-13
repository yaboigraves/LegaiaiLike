class_name EntityController
extends Node2D

var entity_data: EntityData
var entity: Entity


func IsAlive():
	if entity.health > 0:
		return true
	return false
	


func _init(entity_data : EntityData):
	BattleBlackboard.Instance.RegisterEntityController(self)
	self.entity_data = entity_data
	entity = load("res://scenes/entities/entity.tscn").instantiate()
	entity.SetEntityData(entity_data)
	add_child(entity)

#virtual function
func CreateNewTurn():
	pass

#refactor this trash to hand off more responsibility to entity
func ApplyDamageModifier(damage_modifier: DamageModifier):
	entity.health -= damage_modifier.value
	entity.hud.UpdateHealth(entity.health,entity.maxHealth)
	entity.HealthChanged.emit()
	if entity.health <= 0:
		entity.isAlive = false
		entity.Died.emit(self)
		print(self, " died!")
	


