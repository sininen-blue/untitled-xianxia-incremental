class_name Main
extends Control

enum Realm {MORTAL, QI_GATHERING}


@export var breakthrough_curve: Curve

@export var max_breakthrough_deduction: float = 0.15
@export var qi_generation_speed: int = 1


var qi: int = 0: set = _set_qi
var qi_stones: int = 0

var meditation_speed: int = 0
var stage_breakthrough_threshold: float = 0.1
var realm_breakthrough_threshold: float = 0.3

var current_realm: Realm = Realm.MORTAL
var current_stage: int = 0
var breakpoints: Dictionary[Realm, Array] = {
	Realm.MORTAL: [0, 10],
	# should have climbing mountain here
	Realm.QI_GATHERING: [100, 300, 1000],
}


var time: float = 0


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		qi += 1



func _set_qi(new_val: int) -> void:
	qi = new_val

	var stage_threshold: int = breakpoints[current_realm][current_stage]
	if qi > stage_threshold:

		var current_stage_breakthrough_threshold: int = roundi(stage_threshold + (stage_threshold * stage_breakthrough_threshold))
		if qi > current_stage_breakthrough_threshold:
			current_stage += 1
			
			if current_stage >= len(breakpoints[current_realm]):
				current_stage = 0
				current_realm = (current_realm + 1) as Realm

				if current_realm == Realm.QI_GATHERING:
					meditation_speed = 1



func _process(delta: float) -> void:
	time += 1 * delta
	if time >= 1:
		time = 0

		qi += meditation_speed
	

		var stage_threshold: int = breakpoints[current_realm][current_stage]
		if qi > stage_threshold:
			# keep track of how much qi you're making, make stones based on that
			qi_stones += qi_generation_speed

			var current_stage_breakthrough_threshold: int = roundi(stage_threshold + (stage_threshold * stage_breakthrough_threshold))
			if qi < current_stage_breakthrough_threshold:
				# i want it to be "impossible" to breakthrough a realm unless you click like 20cps
				# when you are at 20 percent more than the threshold, it reduces the amount of qi
				# initially you lose 1 percent, up to 30 percent, until you reach your max again
				# linear for now

				var difference: float = qi - stage_threshold
				var percentage: float = difference/stage_threshold
				var sample_point: float = percentage/.2

				var reduction: float = max_breakthrough_deduction * breakthrough_curve.sample_baked(sample_point)

				# Don't increaes by a number, have this be in a pre_processed state, which slowly gets processed
				# so that number goes smoothgly up
				qi -= 1 + roundi(qi * reduction)
