class_name PlayerControlledEntity
extends Entity

var actionBuffer : ActionBuffer

var upAction: Action
var downAction : Action
var leftAction: Action
var rightAction : Action

signal ActionBufferUpdated
signal TargetChanged(target: Entity)


func _ready() -> void:
	super._ready()
	
	#so we gotta actually like spawn our actions now
	#cause they start as packed scenes
	#so entities can create child nodes for these
	#kind of annoying but whatever

	set_process(false)

func SetEntityData(entity_data:EntityData):
	super.SetEntityData(entity_data)
	
	
	
	if entity_data.upAction:
		upAction = entity_data.upAction.instantiate()
		add_child(upAction)
	if entity_data.leftAction:
		leftAction = entity_data.leftAction.instantiate()
		add_child(leftAction)
	if entity_data.downAction:
		downAction = entity_data.downAction.instantiate()
		add_child(downAction)
	if entity_data.rightAction:
		rightAction = entity_data.rightAction.instantiate()
		add_child(rightAction)


func CreateNewTurn():
	super.CreateNewTurn()
	actionBuffer = ActionBuffer.new(ap)
	
func ProcessActionBuffer():
	actionBuffer.CompileActions()

func SetTurnTargets(targets: Array[Entity]):
	actionBuffer.SetTargets(targets)
	
	
func TryAddDirectionToCombo(direction : Symbols.Direction) -> bool:
	
	match(direction):
		Symbols.Direction.UP:
			return actionBuffer.TryAddAction(upAction)
		Symbols.Direction.DOWN:
			return actionBuffer.TryAddAction(downAction)
		Symbols.Direction.LEFT:
			return actionBuffer.TryAddAction(leftAction)
		Symbols.Direction.RIGHT:
			return actionBuffer.TryAddAction(rightAction)
		
	
	return false

	
	#TODO: also make this part of a messenger
	#PlayerInputHandler.instance.StartPlayerControlledEntityTurn(self)

