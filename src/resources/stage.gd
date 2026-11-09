class_name Stage
extends Node


signal breakthrough_achieved()


@export_group("References")
@export var active: bool = false: set = _set_active
@export var realm: Realm
@export var player: Player

@export_group("Data")
@export var qi_cap: int = 0
@export var breakthrough_threshold: float = 0.1


func _ready() -> void:
	GlobalTimer.timeout.connect(_on_timer_timeout)


func _set_active(new_val: bool) -> void:
	active = new_val
	self.set_process(active)


func _on_timer_timeout() -> void:
	if player.qi < qi_cap:
		return

	if player.qi > qi_cap + (qi_cap * breakthrough_threshold):
		breakthrough_achieved.emit()
		return

	player.qi -= 1 # placeholder
