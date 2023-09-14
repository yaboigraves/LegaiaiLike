class_name DamageEffect
extends Effect

@export var value : int
@export var damage_type : Symbols.DamageType

#so lets think about how targets work
#we do the processing for each target 
#thats really per action

#lets add the multiplier effect



func GenerateModifiers(target:EntityController):
	var modifier = DamageModifier.new(value,damage_type,vibe_delta)
	return [modifier]
