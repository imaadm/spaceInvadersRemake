extends KinematicBody2D
#export (PackedScene) var Laser

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 200
var Laser = preload("res://Scenes2/Laser3.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass #

func shoot():
	var laser = Laser.instance()
	owner.add_child(laser)
	laser.transform = $LaserBarrel.global_transform
	$AudioStreamPlayer.play(0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("menu"):
		GlobalVariables.kills = 0
		GlobalVariables.kills2 = 0
		get_tree().change_scene("res://Ttile.tscn")
	if Input.is_action_pressed("ui_left"):
		self.position.x += -speed*delta
	if Input.is_action_pressed("ui_right"):
		self.position.x += speed*delta
	if Input.is_action_just_pressed("shoot"):
		shoot()
	

