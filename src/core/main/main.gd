class_name Main
extends Node






var qi: int = 0

var meditation_gain: int = 1


var initial_cap: int = 10
var scaling_value: float = 1.56


var current_realm_index: int = 0
var current_stage_index: int = 0


@onready var progression: Progression = Progression.new(initial_cap, scaling_value)
@onready var main_timer: Timer = $MainTimer


func _on_main_timer_timeout() -> void:
	qi += meditation_gain


	var current_realm: Realm = progression.realms[current_realm_index]
	var current_stage: Stage = current_realm.stages[current_stage_index]

	if qi > current_stage.cap:
		qi -= 1

	print(current_stage.cap)
