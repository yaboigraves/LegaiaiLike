
class_name Action
extends Node

#so actions are more like chasis then anything now
#actions are just combinations of effects
#not resources anymore
#so start by g

#name isnt needed anymore just get the node name
#@export var actionName : String = "Slapper"

#cost is possibly summized through the child effects?
#maybe we want to tune it idk

@export var actionCost : int
#directions def stay
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


#@export var damage : int = 1
#
##you ought to be able to do multiple afinity damages too
##so lets make like a damage source list for each of these
##rather than just damage
##the damage ought to maybe be divorced from the affinity damage
#@export var damageType : Symbols.DamageType

#so actions get put into a combo
#executing them in order will apply them to their targets
#we also want the caster as a ref so we can do whatever to them

#so first lets handle all the stuff here
#applying an action to game state takes targets, and the caster
#instead of letting targets apply the actions to themselves, have actions actually do the code
#duh

#lets tie this code in now

func ApplyToGameState(targets : Array[Entity], caster: Entity):
#	for target in targets:
#		target.ApplyActionToSelf(self)
	#really depends on the ability, like hwat it does
	
	for effect in get_children():
		print("Applying effect ", effect.name, " to targets")
		
