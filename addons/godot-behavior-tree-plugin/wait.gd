extends "res://addons/godot-behavior-tree-plugin/bt_base.gd"

export(float) var wait_time = 0.0

onready var last_time = OS.get_ticks_msec()

# Decorator Node
func tick(tick):
	.tick(tick)
	var current_time = OS.get_ticks_msec()
	if current_time - last_time > wait_time:
		self.last_time = current_time
		return ERR_BUSY
	return OK
