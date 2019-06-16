extends "res://addons/godot-behavior-tree-plugin/bt_base.gd"

export(float) var wait_time = 0.0

var last_time = 0.0

# Decorator Node
func tick(tick):
	var current_time = OS.get_ticks_msec()
	if current_time - last_time > wait_time:
		self.last_time = current_time
		return ERR_BUSY
	return OK
