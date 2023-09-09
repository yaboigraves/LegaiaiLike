class_name DamageModifier
extends EffectModifier

var value : int = 1
var damage_type : Symbols.DamageType

func _init(value : int, damage_type : Symbols.DamageType, vibe_x : int, vibe_y : int):
	self.value = value
	self.damage_type = damage_type
	self.vibe_x_delta = vibe_x
	self.vibe_y_delta = vibe_y
	
func MultiplyValue(multiplier:int):
	self.value *= multiplier


func ApplyModifier(target_entity: Entity):
	print("Do the damage ")

