class_name Realm
extends Node


signal breakthrough_achieved()

@export_group("References")
@export var active: bool = false: set = _set_active
@export var player: Player
@export var stages: Array[Stage]

@export_group("Data")
@export var qi_cap: int = 0
@export var qi_curve: Curve


var current_stage_index: int = 0


func _set_active(new_val: bool) -> void:
	active = new_val
	self.set_process(active)


func _ready() -> void:
	for child in get_children():
		if child is Stage:
			child.realm = self
			child.player = player
			child.breakthrough_achieved.connect(_on_stage_breakthrough_achieved)
			stages.append(child)
	

	stages[current_stage_index].active = true


func _on_stage_breakthrough_achieved() -> void:
	stages[current_stage_index].active = false

	current_stage_index += 1
	if current_stage_index >= len(stages):
		self.active = false
		breakthrough_achieved.emit()
		return

	stages[current_stage_index].active = true
