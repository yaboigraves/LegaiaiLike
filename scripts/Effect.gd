class_name Effect
extends Node

#SO

#effects are basically containers for code that spawn objects
#each effect is likely a hand scripted ish value
#lets start with damage effects

#all actions generate the same kind of compilation of modifier sources
#a modifiersource is just an object that changes *something* about game state
#whether it be damage, a heal, a check for a threshold, etc
#applying a dot
#effects are kind of like just script based spawners for these

#lets start with a DamageEffect and go from there

#so a x2 works by doing what

#we construct a queue of things to process

#first we take the x2 off the stack
#when we take the next thing (damage effect) we apply the x2 modifier to the damage sources from the effect
#so each effect returns an effectmodifier base class


#used to actually invoke the effect, using a single target
#the idea is we want to roll against certain target stats
#I think stuff that targets multiple people will just use the stack of modifiers multiple times

@export var vibe_x_delta: int
@export var vibe_y_delta : int

func GenerateModifiers(target: Entity):
	pass





