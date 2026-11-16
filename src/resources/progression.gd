class_name Progression
extends Resource


var realms: Array[Realm] = []


var stage_index: int = 0
var current_cap: int = 0
var scaling: float = 0


func _init(_initial_cap: int = 0, _scaling_value: float = 0.0) -> void:
	current_cap = _initial_cap
	scaling = _scaling_value

	realms.append(Realm.new("Mortal", [
		Stage.new("The first steps", _recalculate_cap()),
		Stage.new("To see the world breathe", _recalculate_cap()),
	]))
	realms.append(Realm.new("Qi Building", [
		Stage.new("1st Stage", _recalculate_cap()),
		Stage.new("2nd Stage", _recalculate_cap()),
		Stage.new("3rd Stage", _recalculate_cap()),
		Stage.new("4th Stage", _recalculate_cap()),
		Stage.new("5th Stage", _recalculate_cap()),
		Stage.new("6th Stage", _recalculate_cap()),
		Stage.new("7th Stage", _recalculate_cap()),
	]))
	realms.append(Realm.new("Foundation Building", [
		Stage.new("To temper the skin", _recalculate_cap()),
		Stage.new("To temper the muscles", _recalculate_cap()),
		Stage.new("To temper the bones", _recalculate_cap()),
		Stage.new("To temper the viscera", _recalculate_cap()),
		Stage.new("To condense qi", _recalculate_cap()),
	]))
	realms.append(Realm.new("Core Formation", [
		Stage.new("Early Stage", _recalculate_cap()),
		Stage.new("Mid Stage", _recalculate_cap()),
		Stage.new("Late Stage", _recalculate_cap()),
	]))
	realms.append(Realm.new("Nascent Soul", [
		Stage.new("Early Stage", _recalculate_cap()),
		Stage.new("Mid Stage", _recalculate_cap()),
		Stage.new("Late Stage", _recalculate_cap()),
	]))


func _recalculate_cap() -> int:
	if stage_index > 0:
		current_cap = roundi(current_cap + pow(scaling, stage_index))
	stage_index += 1

	return current_cap
