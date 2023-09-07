class_name PlayerTurnState
extends State

var player_state_machine: StateMachine
var entity : Entity

func _ready() -> void:
	player_state_machine = $StateMachine

func enter(args = {}):
	super.enter(args)
	
	entity = args.entity
	
	#create a new turn for this entity
	
	entity.CreateNewTurn()
	
	#set the entity for all the child states
	for state in player_state_machine.get_children():
		state.SetCurrentEntity(entity)
	
	
	#ok so the player turn actually like we discussed has its own sub phases
	#these are sequential
	#so we st art off by going into root input state
	
	
	player_state_machine.transition_to("RootPlayerInputState")



func HandleInput(input: PlayerInput):
	player_state_machine.HandleInput(input)
