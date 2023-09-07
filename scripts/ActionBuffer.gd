class_name ActionBuffer
extends RefCounted

var maxActionSize : int = 4
var actionSize : int = 0
var actions : Array[Action]
var target : Entity
var targets: Array[Entity]

func _init(ap:int = 4):
	maxActionSize = ap


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
