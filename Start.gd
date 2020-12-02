extends Control



func _on_start_pressed():
	get_tree().change_scene("res://Scenes/level2.tscn")
	


func _on_quit_pressed():
	get_tree().quit()


func _on_remake_pressed():
	get_tree().change_scene("res://Level1.tscn")
