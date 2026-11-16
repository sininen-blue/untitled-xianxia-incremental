class_name Main
extends Node


@onready var main_timer: Timer = $MainTimer


var qi: int = 0

var meditation_gain: int = 1


var initial_cap: int = 10
var scaling_value: float = 1.56


var current_realm_index: int = 0
var current_stage_index: int = 0


func _on_main_timer_timeout() -> void:
	qi += meditation_gain
