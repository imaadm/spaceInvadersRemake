extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	set_text("Lives: " + str(GlobalVariables.lives))

func _process(delta):
	set_text("Lives: " + str(GlobalVariables.lives))
