extends KinematicBody2D

const UP = Vector2(0, -1)

const SPEED = 0.75

var direction = 1
var count = 0
var Laser = preload("res://enemyLaser.tscn")
var shootOnce = true


func shoot():
	if shootOnce == true:
		$AudioStreamPlayer.play()
		var laser = Laser.instance()
		owner.add_child(laser)
		laser.transform = $enemyLaserBarrel.global_transform
		shootOnce = false

func _physics_process(delta):
	count+=1
	position.x += SPEED*direction
	if(count% 150 == 0):
		direction = direction*-1

func _process(delta):
	var enemyTimer = GlobalTimer.seconds;
	if enemyTimer % 4 == 0:
		shoot()
	else:
		shootOnce = true

		

		
		
		
