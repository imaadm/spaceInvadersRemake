extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 300
var velocity = Vector2()

var shieldTexture2 = preload("res://physicspack/PNG/Metal elements/elementMetal015.png") #15
var shieldTexture3 = preload("res://physicspack/PNG/Metal elements/elementMetal050.png")#50


var hitCount1 = 0
var hitCount2 = 0
var hitCount3 = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += transform.x * speed * delta
	
func start(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)


func _on_enemyLaser_body_entered(body):
	if body.is_in_group("player"):
		if (GlobalVariables.lives == 0):
			 get_tree().change_scene("res://Ttile.tscn")
		GlobalVariables.lives = GlobalVariables.lives -1
		queue_free()
	if body.is_in_group("shield1") && hitCount1 == 0:
		get_node("/root/GameScene/Shield1/Shield").set_texture(shieldTexture2)
		queue_free()
		hitCount1 = hitCount1 + 1

	if body.is_in_group("shield1") && hitCount1 == 1:
		get_node("/root/GameScene/Shield1/Shield").set_texture(shieldTexture3)
		queue_free()
		hitCount1 = hitCount1 + 1

	if body.is_in_group("shield1") && hitCount1 == 2:
		queue_free()
		#body.queue_free()

	if body.is_in_group("shield2") && hitCount2 == 0:
		get_node("/root/GameScene/Shield2/Shield").set_texture(shieldTexture2)
		queue_free()
		hitCount2 = hitCount2 + 1
	if body.is_in_group("shield2") && hitCount2 == 1:
		get_node("/root/GameScene/Shield2/Shield").set_texture(shieldTexture3)
		queue_free()
		hitCount2 = hitCount2 + 1
	if body.is_in_group("shield2") && hitCount2 == 2:
		#body.queue_free()
		queue_free()
	if body.is_in_group("shield3") && hitCount3 == 0: 
		get_node("/root/GameScene/Shield3/Shield").set_texture(shieldTexture2)
		queue_free()
		hitCount3 = hitCount3 + 1

	if body.is_in_group("shield3") && hitCount3 == 1:
		get_node("/root/GameScene/Shield3/Shield").set_texture(shieldTexture3)
		queue_free()
		hitCount3 = hitCount3 + 1

	if body.is_in_group("shield3") && hitCount3 == 2:
		#body.queue_free()
		queue_free()
		

