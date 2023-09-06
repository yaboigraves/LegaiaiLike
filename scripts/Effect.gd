class_name Effect
extends Node

#so this is a base class that basically creates a way to do literally any effect
#actions basically just are created by adding multiple effects as children
#order as children dictates execution order of effects
#so you can for example, buff a target

#i think we ought to have the code run in here too

#so effects will get stacked 
#heal then damage vs damage then heal etc
#so we should be able to like apply damage etc etc 

#all effects have possible affinity contributions too
#there can be multiple affinity effects
#affinity effects ought to be a class too

#like some blocks might move the affinity around for example
#so affinity modifiers might actually be nodes too
#this is actually kinda good ngl

#nah those being nodes is fugly

#temp
@export var affinity_x_modifier : int = 0
@export var affinity_y_modifier : int = 0
