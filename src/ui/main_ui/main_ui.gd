class_name MainUI
extends Control


@export var main: Main


@onready var stage_label: Label = %StageLabel
@onready var realm_label: Label = %RealmLabel
@onready var qi_label: Label = %QiLabel
@onready var meditation_gain_label: Label = %MeditationGainLabel


func _process(_delta: float) -> void:
	realm_label.text = "realm: " + str(main.get_current_realm())
	stage_label.text = "stage: " + str(main.get_current_stage())

	qi_label.text = "qi: " + str(main.qi)
	meditation_gain_label.text = "meditation gain: " + str(main._get_meditation_gain())
