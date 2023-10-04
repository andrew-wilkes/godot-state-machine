# Godot State Machine
Godot 4 State Machine using GDScript

This code is associated with this tutorial: [Godot State Machine](https://gdscript.com/godot-state-machine)

The updated version works by only having the current state node as a child of the Statemachine node. It allows for a very simple code structure.

The other states are in a floating state with no parent, so they don't receive calls to the game loop functions such as `_process` and `_input`.

The state nodes are identified by their name and must implement an `enter()` and `exit(next_node_name)` function.
