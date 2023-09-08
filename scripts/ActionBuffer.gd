class_name ActionBuffer
extends RefCounted

var maxActionSize : int = 4
var actionSize : int = 0
var actions : Array[Action]
var target : Entity
var targets: Array[Entity]

func _init(ap:int = 4):
	maxActionSize = ap

#iterate over all the actions and build a big ol queue of modifiers
#then we process the modifiers to see if any will effect one another, add battle state, yada yada
#the entity will do that part I think
#this will basically just spit out the modifiers and we're good I think
#return a dictionary of each target or something

func CompileActions():
	var modifier_stack : Array[EffectModifier]
	for action in actions:
		var action_modifiers = action.CompileEffects(targets)
		modifier_stack.append_array(action_modifiers)
	
	#OK so we got something now
	#break, go for a run get some sun
	
	print(modifier_stack)


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
		

func SetTargets(targets:Array[Entity]):
	self.targets = targets
