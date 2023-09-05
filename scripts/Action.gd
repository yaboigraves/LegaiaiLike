class_name Action
extends Resource

@export var actionName : String = "Slapper"
@export var actionCost : int
@export var direction : Symbols.Direction

#actions could be nodes actually
#that actually might be kinda smart...
#so what if actions are all scenes
#we can construct new actions by combining nodes that represent things the action does
#cause as of now we construct a new action for each
#which is kinda bad
#this will make the player construction process easier too....
#ok lets do it, after a quick break

#so this is going to horribly break the game to do so lets branch


@export var damage : int = 1

#you ought to be able to do multiple afinity damages too
#so lets make like a damage source list for each of these
#rather than just damage
#the damage ought to maybe be divorced from the affinity damage
@export var damageType : Symbols.DamageType


func ApplyToGameState(targets : Array[Entity]):
	for target in targets:
		target.ApplyActionToSelf(self)
		
