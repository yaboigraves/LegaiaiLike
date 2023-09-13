class_name ActionBuffer
extends RefCounted

var maxActionSize : int = 4
var actionSize : int = 0
var actions : Array[Action]
var target : Entity
var targets: Array[EntityController]

var effect_modifier_queue : Array[EffectModifier]


func _init(ap:int = 4):
	maxActionSize = ap

#just make one of these
#Ok cool

#so now the entity can use this!

func CompileActions():
	effect_modifier_queue.clear()
	
	for action in actions:
		var action_modifiers = action.CompileEffects(target)
		effect_modifier_queue.append_array(action_modifiers)
	

func IsValidCombo():
	if actionSize > 0:
		return true
	return false

func TryAddAction(action:Action) -> bool:
	if actionSize + action.actionCost <= maxActionSize:
		actions.append(action)
		actionSize += action.actionCost
		return true
	else:
		return false

func RemoveLastAction():
	if actions.size() > 0:
		var removedAction = actions.pop_back()
		actionSize -= removedAction.actionCost
		

func SetTargets(targets:Array[EntityController]):
	self.targets = targets
