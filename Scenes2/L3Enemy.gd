extends KinematicBody2D

const UP = Vector2(0, -1)

const SPEED = 0.75


var direction = 1
var count = 0
var Laser = preload("res://enemyLaser.tscn")
var shootOnce = true

var cont = false
#func shoot():
#	if shootOnce == true:
#		var laser = Laser.instance()
#		owner.add_child(laser)
#		laser.transform = $enemyLaserBarrel.global_transform
#		shootOnce = false

func _physics_process(delta):
	var enemyTimer = GlobalTimer.seconds;
	if (enemyTimer % 3 == 0 && enemyTimer > 0):
		cont = true
	if (enemyTimer % 3 == 1 && enemyTimer > 0):
		cont = false
	if (cont == true):
		count+=1
		position.y += SPEED*direction
	if (count % 625 == 0 && count > 1):
		get_tree().change_scene("res://Ttile.tscn")
#func _process(delta):
#	var enemyTimer = GlobalTimer.seconds;
#	if (enemyTimer % 3  == 0 && enemyTimer > 0):
#		shoot()
#	else:
#		shootOnce = true

		

		
		
		
