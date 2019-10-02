extends Node

var fsm: StateMachine

func enter():
	print("Hello from State 2!")
	yield(get_tree().create_timer(2.0), "timeout")
	exit()

func exit():
	# Go back to the last state
	fsm.back()
