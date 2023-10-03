extends Node

class_name StateMachine

const DEBUG = true

var current_state: Object

var history = []
var states = []

func _ready():
	states = get_children()
	# Set the initial state to the first child node
	set_state(states[0].name)
	# Allow for all nodes to be ready before calling _enter_state
	#call_deferred("_enter_state")


func change_to(new_state_id):
	history.append(new_state_id)
	call_deferred("set_state", new_state_id)



func back():
	if history.size() > 0:
		call_deferred("set_state", history.pop_back())


func _enter_state():
	if DEBUG:
		print("Entering state: ", current_state.name)
	# Give the new state a reference to it's state machine i.e. this one
	current_state.fsm = self
	current_state.enter()


func set_state(state_name):
	for a_state in states:
		if a_state.name == state_name:
			current_state = a_state
			if not a_state.get_parent():
				add_child(a_state)
		else:
			if a_state.get_parent():
				remove_child(a_state)
	_enter_state()
