class_name Player
extends Node


@export var qi: int = 0
@export var meditation_speed: int = 1

@export var current_realm: Realm


func _ready() -> void:
	GlobalTimer.timeout.connect(_on_timer_timeout)


func _process(delta: float) -> void:
	print("Qi: ", qi)


func _on_timer_timeout() -> void:
	self.qi += meditation_speed
