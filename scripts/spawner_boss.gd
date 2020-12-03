extends Node

const boss = [
	preload("res://scenes/enemy_boss.tscn")
]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():

	var enemy = utils.choose(boss).instance()
	var enm_pos = Vector2()
	enm_pos.x   = 100
	enm_pos.y   = 0
	enemy.position = enm_pos
	$Node.add_child(enemy)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
