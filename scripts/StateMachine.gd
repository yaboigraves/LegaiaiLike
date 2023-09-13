class_name StateMachine
extends Node

# Emitted when transitioning to a new state.
signal transitioned(state)
#Path to the initial active state. We export it to be able to pick the initial state in the inspector.
@export var initial_state := NodePath()
# The current active state. At the start of the game, we get the `initial_state`.
@onready var state

@export var autostart : bool = true

func _ready() -> void:
	if initial_state:
		state = get_node(initial_state) as State
	#await owner.ready

	# The state machine assigns itself to the State objects' state_machine property.
	for child in get_children():
		child.state_machine = self
	

	
	if autostart:
		state.enter()
		set_process(true)
		set_physics_process(true)
		set_process_unhandled_input(true)
	else:
		set_process(false)
		set_physics_process(false)
		set_process_unhandled_input(false)


func StartMachine():
	set_process(true)
	set_physics_process(true)
	set_process_unhandled_input(true)
	state.enter()

func HandleInput(input : PlayerInput):
	if state:
		state.HandleInput(input)

# The state machine subscribes to node callbacks and delegates them to the state objects.
func _unhandled_input(event: InputEvent) -> void:
	state.handle_input(event)

func _process(delta: float) -> void:
	state.update(delta)


func _physics_process(delta: float) -> void:
	state.physics_update(delta)

# This function calls the current state's exit() function, then changes the active state,
# and calls its enter function.
# It optionally takes a `msg` dictionary to pass to the next state's enter() function.
func transition_to(target_state_name: String, msg: Dictionary = {}, startProcessing = false) -> void:
	# Safety check, you could use an assert() here to report an error if the state name is incorrect.
	# We don't use an assert here to help with code reuse. If you reuse a state in different state machines
	# but you don't want them all, they won't be able to transition to states that aren't in the scene tree.
	if not has_node(target_state_name):
		return
		
	if state:
		state.exit()
		
	if startProcessing:
		set_process(true)
		set_physics_process(true)
		set_process_unhandled_input(true)

	state = get_node(target_state_name)
	state.enter(msg)
	emit_signal("transitioned", state)
	
