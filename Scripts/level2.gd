extends Node2D

var bulletScene = preload("res://scenes/BulletLevel2.tscn")
var enemyScene = preload("res://scenes/enemyLevel2.tscn")
var playerScene = preload("res://scenes/PlayerLevel2.tscn")
var shieldScene = preload("res://scenes/ShieldLevel2.tscn")
var enemyArray = []
var rows = 5
var collumns = 10

# Initializations
func _ready():
	InitializePlayer()
	InitializePlayerLives()
	InitializeEnemies()
	InitializeShields()
	InitializeBulletTimer()
	load_high_score()

func InitializePlayer():
	var player = playerScene.instance()
	add_child(player)
	player.get_child(0).play("default")
	player.position = Vector2(get_viewport().size.x / 2, get_viewport().size.y - 40)
	player.scale = Vector2(4,4)

func InitializePlayerLives():
	for i in Global.player_lives:
		var player = playerScene.instance()
		add_child(player)
		player.get_child(0).play("default")
		player.position = Vector2(960 - (64 * i), 32)
		player.scale = Vector2(4,4)

func InitializeEnemies():
	for row in rows:
		for collumn in collumns:
			var enemy = enemyScene.instance()
			var spawnLocation = Vector2((36 + (36 * collumn) + (16 * collumn)),(140 + (24 * row) + (16 * row)))
			add_child(enemy)
			enemy.position = spawnLocation
			if enemy.position.y < 142:
				enemy.get_child(0).play("Enemy3")
				enemy.pointsOnKill = 30
			elif enemy.position.y > 142 and enemy.position.y < 222:
				enemy.get_child(0).play("Enemy2")
				enemy.pointsOnKill = 20
			else:
				enemy.get_child(0).play("Enemy1")
				enemy.pointsOnKill = 10
			enemy.scale = Vector2(3,3)
			enemyArray.append(enemy)

func InitializeShields():
	for i in 4:
		var shield = shieldScene.instance()
		var spawnLocation = Vector2(250 + (164 * i), 470)
		add_child(shield)
		shield.position = spawnLocation
		shield.scale = Vector2(7, 7)

func InitializeBulletTimer():
	$BulletTimer.wait_time = 0.1
	$BulletTimer.start()


# Save game
func save_high_score():
	var file = File.new()
	file.open("user://high_score.save", File.WRITE)
	file.store_line(to_json(Global.high_score))
	file.close()

func load_high_score():
	var file = File.new()
	if not file.file_exists("user://high_score.save"):
		print("no file")
		return
	file.open("user://high_score.save", File.READ)
	Global.high_score = int(file.get_as_text())
	file.close()

# Shoot bullets
func _on_BulletTimer_timeout():
	var enemy = enemyArray[int(rand_range(0, enemyArray.size() -1))]
	enemy.isBodyBlocking()
	if enemy.bodyBlocking == false:
		enemy_shoot_bullet(enemy)
		
func enemy_shoot_bullet(var enemy):
	var bullet = bulletScene.instance()
	var spawnLocation = Vector2((enemy.position.x),(enemy.position.y + 30))	
	add_child(bullet)
	var bulletType = "Bullet" + str(int(rand_range(1,3)))
	bullet.get_child(0).play(bulletType)
	bullet.position = spawnLocation
	bullet.motion = Vector2(0, 5)
	bullet.scale = Vector2(4, 4)
 
func player_shoot_bullet(var player):
	var bullet = bulletScene.instance()
	var spawnLocation = Vector2((player.position.x), (player.position.y - 30))
	add_child(bullet)
	bullet.get_child(0).play("BulletPlayer")
	bullet.position = spawnLocation
	bullet.motion = Vector2(0, -7)
	bullet.scale = Vector2(2.5, 2.5)

# Red enemy

# Enemy array
func enemy_remove_from_array(enemy):
	enemyArray.remove(enemyArray.find(enemy))
	enemyArray.sort()
	if enemyArray.size() <= 0:
		get_tree().reload_current_scene()
		Global.score += 150
	$BulletTimer.wait_time += 0.01
