class_name MultiplierModifier
extends EffectModifier

var depth : int
var multiplier: int

func _init(depth: int, multiplier: int, vibe_delta : Vector2i):
	self.depth = depth
	self.multiplier = multiplier
	self.vibe_delta = vibe_delta
func ApplyModifier(targets: Array[EffectModifier]):

	#TODO: actually try to multiply a value
	#all effects should be multiplicable i assume
	for target in targets:
		target.MultiplyValue(multiplier)

func MultiplyValue(multiplier: int):
	self.multiplier *= multiplier
