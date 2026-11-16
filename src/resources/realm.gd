class_name Realm
extends Resource


var title: String
var stages: Array[Stage] = []


func _init(_title: String = "", _stages: Array = []) -> void:
	title = _title
	stages.assign(_stages)

