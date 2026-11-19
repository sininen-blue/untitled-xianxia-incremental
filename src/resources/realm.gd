class_name Realm
extends Resource


var title: String
var stages: Array[Stage]


func _init(_title: String, _stages: Array[Stage]) -> void:
	title = _title
	stages = _stages


func _to_string() -> String:
	return title
