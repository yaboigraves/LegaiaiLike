class_name BattleUIManager
extends Node

static var instance : BattleUIManager

var stateMachine : StateMachine


func _init():
	super._init()
	instance = self
	
	
	
func BindEntityToUI(entity: Entity):
	if entity is PlayerControlledEntity:
		$StateMachine.transition_to("PlayerTurn",{"player" : entity as PlayerControlledEntity})
	
	elif entity is AIControlledEntity:
		$StateMachine.transition_to("EnemyTurn",{"enemy" : entity as AIControlledEntity})






