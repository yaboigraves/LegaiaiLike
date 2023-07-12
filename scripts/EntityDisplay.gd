class_name EntityDisplay
extends Control

var entity: Entity


func LoadEntity(entity: Entity):
	$HBoxContainer/Icon.texture = entity.entityData.icon
	$HBoxContainer/Health.max_value = entity.health
	$HBoxContainer/Health.value = entity.health
	entity.HealthChanged.connect(HandleHealthChanged)
	self.entity = entity

func HandleHealthChanged():
	$HBoxContainer/Health.value = entity.health
