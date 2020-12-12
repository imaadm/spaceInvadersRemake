extends Area2D

export var armor = 200 setget set_armor
const scn_laser     = preload("res://scenes/laser_enemy.tscn")
const scn_explosion = preload("res://scenes/explosion.tscn" )
const scn_can = preload("res://scenes/cannon.tscn")
export var score_value = 10000
export var velocity = Vector2()


func _ready():
	add_to_group("enemy_boss")

	yield(utils.create_timer(0.5), "timeout")
	shoot()
	shootCan()
	pass

func _process(delta):
	translate(velocity * delta)
	if self.position.x <= 0+160:
		velocity.x = abs(velocity.x)
		print("left")
	
	if (self.position.x >= utils.view_size.x-150):
		velocity.x = -abs(velocity.x)
	pass

func shoot():
	while true:
		create_laser($fire/left.global_position)
		create_laser($fire/right.global_position)
		

		
		yield(utils.create_timer(0.8), "timeout")
	pass

func set_armor(new_value):

	if is_queued_for_deletion(): return
	if new_value < armor: audio_player.play("hit_enemy")
	armor = new_value
	
	if armor <= 0:
		utils.search_node("tex_score").score += score_value
		create_explosion()
		queue_free()
		GlobalVariables.kills = 0
		GlobalVariables.kills2 = 0
		get_tree().change_scene("res://GameOver.tscn")

	pass

func shootCan():
	while true:
		var can = scn_can.instance()
		can.position = $fire/cannon.global_position
		utils.main_node.add_child(can)
		
		yield(get_tree().create_timer(5), "timeout")
	pass

func create_laser(pos):
	var laser = scn_laser.instance()
	laser.position = pos
	utils.main_node.add_child(laser)
	return laser
	pass

func create_explosion():
	var explosion = scn_explosion.instance()
	explosion.position = self.position
	utils.main_node.add_child(explosion)
	pass
