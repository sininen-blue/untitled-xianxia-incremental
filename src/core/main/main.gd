class_name Main
extends Node


@export_group("Stats")
@export var qi: int = 0
@export var impurities_percent: float = 0
@export var heart_demons_percent: float = 0


@export_group("Substats")
@export var deduction_scaling: float = 2.0


@export_group("Progression")
@export var initial_cap: int = 10
@export var scaling_value: float = 1.56


var current_realm_index: int = 0
var current_stage_index: int = 0


@onready var progression: Progression = Progression.new(initial_cap, scaling_value)
@onready var main_timer: Timer = $MainTimer


func _on_main_timer_timeout() -> void:
	qi += _get_meditation_gain()


	var current_realm: Realm = progression.realms[current_realm_index]
	var current_stage: Stage = current_realm.stages[current_stage_index]

	if qi > current_stage.cap:
		var over_percent: float = qi - float(current_stage.cap) / float(current_stage.cap)
		qi -= _get_qi_deduction(over_percent, 30)


func _get_meditation_gain() -> int:
	var base_value: float = 1

	var impurities_base: float = 1
	var impurities_weight: float = 0
	var impurities_deduct: float = impurities_base * impurities_weight

	var heart_demon_base: float = 1
	var heart_demon_weight: float = 0
	var heart_demon_deduct: float = heart_demon_base * heart_demon_weight

	var result: int = roundi(base_value - impurities_deduct - heart_demon_deduct)
	return result


func _get_qi_deduction(over_percent: float, max_rate: float) -> int:
	return roundi(max_rate * (over_percent / 0.3)**deduction_scaling)
