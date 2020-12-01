extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var enemyscene

# Called when the node enters the scene tree for the first time.
func _ready():
	enemyscene = load ("res://L1Enemy.tscn")	
	_spawn_enemies()
func _spawn_enemies():
	for j in range (0,4):
		for i in range (0,11):
			var enemy = enemyscene.instance()
			var x = 0+i*95
			enemy.position.y=j*90
			enemy.position.x=x
			add_child(enemy)
