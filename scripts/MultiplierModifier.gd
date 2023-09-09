class_name MultiplierModifier
extends EffectModifier

var depth : int
var multiplier: int

func _init(depth: int, multiplier: int, x_delta, y_delta):
	self.depth = depth
	self.multiplier = multiplier
	self.vibe_x_delta = x_delta
	self.vibe_y_delta = y_delta

func ApplyModifier(targets: Array[EffectModifier]):

	#TODO: actually try to multiply a value
	#all effects should be multiplicable i assume
	for target in targets:
		target.MultiplyValue(multiplier)

func MultiplyValue(multiplier: int):
	self.multiplier *= multiplier
