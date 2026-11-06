class_name Main
extends Control


var qi: int = 0

var realms: Dictionary[String, Array] = {
	"mortal": [10],
	"qi gathering": [100, 300, 1000],
}


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		qi += 1
