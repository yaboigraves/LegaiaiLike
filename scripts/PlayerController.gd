class_name PlayerController
extends EntityController

var action_buffer: ActionBuffer

var up_action : Action
var down_action : Action
var left_action : Action
var right_action : Action

func _init(entity_data : PlayerControlledEntityData):
	super._init(entity_data)
	up_action = entity_data.upAction.instantiate()
	add_child(up_action)
	
	down_action = entity_data.downAction.instantiate()
	add_child(down_action)
	
	left_action = entity_data.leftAction.instantiate()
	add_child(left_action)
	
	right_action = entity_data.rightAction.instantiate()
	add_child(right_action)

func SetTurnTargets(targets:Array[EntityController]):
	action_buffer.SetTargets(targets)

func CreateNewTurn():
	action_buffer = ActionBuffer.new()

func ConfirmPlayerCombo():
	action_buffer.CompileActions()

func TryAddDirectionToCombo(direction : Symbols.Direction) -> bool:
	match(direction):
		Symbols.Direction.UP:
			return action_buffer.TryAddAction(up_action)
		Symbols.Direction.DOWN:
			return action_buffer.TryAddAction(down_action)
		Symbols.Direction.LEFT:
			return action_buffer.TryAddAction(left_action)
		Symbols.Direction.RIGHT:
			return action_buffer.TryAddAction(right_action)
		
	return false

	
