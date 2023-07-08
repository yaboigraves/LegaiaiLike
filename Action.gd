class_name Action
extends Resource

@export var actionName : String = "Slapper"
@export var actionCost : int
@export var direction : Symbols.Direction

@export var damage : int = 1
@export var damageType : Symbols.DamageType


func ApplyToGameState(targets : Array[Entity]):
	for target in targets:
		target.ApplyActionToSelf(self)
		
