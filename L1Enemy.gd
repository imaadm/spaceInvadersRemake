extends KinematicBody2D

const UP = Vector2(0, -1)

const SPEED = 0.50


var direction = 1
var count = 0
var Laser = preload("res://enemyLaser.tscn")
var shootOnce = true
var count2 = 0
var cont = true
func shoot():
	if shootOnce == true:
		var laser = Laser.instance()
		owner.add_child(laser)
		laser.transform = $enemyLaserBarrel.global_transform
		shootOnce = false

func _physics_process(delta):
	var enemyTimer = GlobalTimer.seconds;
	if (enemyTimer % 4 == 0 && enemyTimer > 0):
		cont = false
	if (enemyTimer % 4 == 1 && enemyTimer > 0):
		cont = true
	if (cont == true):
		count+=1
		position.y += SPEED*direction
	if (count % 725 == 0):
		position.y = 0
func _process(delta):
	var enemyTimer = GlobalTimer.seconds;
	if (enemyTimer % 5 == 0 && enemyTimer > 0):
		shoot()
	else:
		shootOnce = true

		

		
		
		
