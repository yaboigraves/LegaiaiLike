class_name DamageModifier
extends EffectModifier

var value : int = 1
var damage_type : Symbols.DamageType

func _init(value : int, damage_type : Symbols.DamageType, vibe_delta: Vector2i):
	self.value = value
	self.damage_type = damage_type
	self.vibe_delta = vibe_delta
	
func MultiplyValue(multiplier:int):
	self.value *= multiplier


func ApplyModifier(target_entity: Entity):
	print("Do the damage ")
