class_name MultiplierEffect
extends Effect
@export var depth : int = 1
@export var multiplier : int = 2


func GenerateModifiers(target:Entity) -> Array[EffectModifier]:
	var modifier = MultiplierModifier.new(depth,multiplier,vibe_delta)
	return [modifier]
