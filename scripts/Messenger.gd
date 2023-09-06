
extends Node


#so we can just create a bunch of signals here that are globally acessible
#endpoints you can listen to

#so for example, when an entity is done with its turn

#we signal up technically
#ya know what what if we dont need that
#well actually yeah we do

#the UI can listen to this though



signal EntityTurnStarted(entity: Entity)
signal EntityTurnDone(entity: Entity)
#so lets start making events

signal TurnOrderUpdated(turn_order: Array[Entity], index: int)

