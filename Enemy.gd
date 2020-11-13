extends KinematicBody2D

const UP = Vector2(0, -1)

const SPEED = 0.5

var direction = 1
var count = 0


func _physics_process(delta):
	count+=1
	position.x += SPEED*direction
	if(count% 150 == 0):
		direction = direction*-1


