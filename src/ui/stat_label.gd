class_name StatLabel
extends Label


@export var target: Node
@export var prefix: String
@export var property: String


func _process(_delta: float) -> void:
	return
	self.text = prefix + ": " + str(target.get(property))
