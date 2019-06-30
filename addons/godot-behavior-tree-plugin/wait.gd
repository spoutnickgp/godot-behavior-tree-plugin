extends "res://addons/godot-behavior-tree-plugin/bt_base.gd"

export(float) var wait_time = 0.0

func open(tick):
	var current_time = OS.get_ticks_msec()
	tick.blackboard.set("timer", current_time, tick.tree, self)

# Decorator Node
func tick(tick):
	.tick(tick)
	var last_time = tick.blackboard.get("timer", tick.tree, self)
	var current_time = OS.get_ticks_msec()
	if current_time - last_time < wait_time:
		return ERR_BUSY
	
	tick.blackboard.set("timer", current_time, tick.tree, self)
	return OK
