extends Node

class_name StateMachine

var current_state: Object

var history = []
var states = []

func _ready():
	states = get_children()
	# Set the initial state to the first child node
	set_state(states[0].name)


func change_to(new_state_id):
	prints("change_to", new_state_id)
	history.append(current_state.name)
	#call_deferred("set_state", new_state_id)
	set_state(new_state_id)



func back():
	if history.size() > 0:
		var next_state = history.pop_back()
		#call_deferred("set_state", next_state)
		set_state(next_state)


func _enter_state():
	# Give the new state a reference to it's state machine i.e. this one
	current_state.fsm = self
	current_state.enter()


func set_state(state_name):
	for a_state in states:
		if a_state.name == state_name:
			current_state = a_state
			if a_state.get_parent() == null:
				add_child(a_state)
		else:
			if a_state.get_parent():
				remove_child(a_state)
	_enter_state()
