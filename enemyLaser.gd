extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 300
var velocity = Vector2()
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
		body.queue_free()
		queue_free()
	#if body.is_in_group("terrain"):
		#body.queue_free()
		#queue_free()
