
class_name Action
extends Node

@export var actionCost : int
@export var direction : Symbols.Direction

#alright alright
#so we actually want to execute these individually
#but we want to compile a total delta in gamestate
#this is like, using multipliers, checking status effects, etc
#so we dont actually apply these to gamestate persay
#really what we want is for the action buffer to process the outcome of these

#to start, lets get 4 unique actions


func ApplyToGameState(targets : Array[Entity], caster: Entity):
#	for target in targets:
#		target.ApplyActionToSelf(self)
	#really depends on the ability, like hwat it does
	
	for effect in get_children():
		print("Applying effect ", effect.name, " to targets")
		
