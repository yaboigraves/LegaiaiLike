class_name Action
extends Node

@export var actionCost : int
@export var direction : Symbols.Direction


#so we compile all the effects into a stack of actual modifiers


func CompileEffects(targets: Array[Entity]):

	for target in targets:
		var modifiers : Array[EffectModifier]
		for effect in get_children():
			var effect_modifiers = effect.GenerateModifiers(target)
			modifiers.append_array(effect_modifiers)
		return modifiers
		
func ApplyToGameState(targets : Array[Entity], caster: Entity):
#	for target in targets:
#		target.ApplyActionToSelf(self)
	#really depends on the ability, like hwat it does
	
	for effect in get_children():
		print("Applying effect ", effect.name, " to targets")
		
