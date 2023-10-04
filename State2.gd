extends Node

var fsm: StateMachine

func enter():
	print("Hello from State 2!")
	await get_tree().create_timer(2.0).timeout
	exit()


func exit():
	# Go back to the last state
	fsm.back()


func _unhandled_key_input(event):
	if event.pressed:
		print("From State2")
