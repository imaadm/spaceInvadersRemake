extends KinematicBody2D
#export (PackedScene) var Laser

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 200
var Laser = preload("res://Laser.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass #

func shoot():
	var laser = Laser.instance()
	owner.add_child(laser)
	laser.transform = $LaserBarrel.global_transform
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	

	if Input.is_action_pressed("ui_left"):
		self.position.x += -speed*delta
	if Input.is_action_pressed("ui_right"):
		self.position.x += speed*delta
	if Input.is_action_just_pressed("shoot"):
		shoot()
	

