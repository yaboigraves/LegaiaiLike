class_name DamageModifier
extends EffectModifier

var damage : int = 1
var damage_type : Symbols.DamageType

func _init(damage : int, damage_type : Symbols.DamageType, vibe_x : int, vibe_y : int):
	self.damage = damage
	self.damage_type = damage_type
	self.vibe_x_delta = vibe_x
	self.vibe_y_delta = vibe_y
