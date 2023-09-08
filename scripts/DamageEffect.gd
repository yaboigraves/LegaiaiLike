class_name DamageEffect
extends Effect

@export var damage : int
@export var damage_type : Symbols.DamageType


func GenerateModifiers(target:Entity):
	var modifier = DamageModifier.new(damage,damage_type,vibe_x_delta,vibe_y_delta)
	return [modifier]
