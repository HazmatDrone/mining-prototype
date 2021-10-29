extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var move_speed = 500
export var max_health = 100
var health = max_health

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var speed = Vector2(0,0)
	
	if health > 0:
		if Input.is_action_pressed("move_up"):
			speed.y -= move_speed
		if Input.is_action_pressed("move_down"):
			speed.y += move_speed
		if Input.is_action_pressed("move_right"):
			speed.x += move_speed
		if Input.is_action_pressed("move_left"):
			speed.x -= move_speed

		move_and_slide(100 * speed * delta)
		
	if Input.is_action_just_pressed("ui_select"):
		health -= 50
	if health == 0:
		rotation_degrees = 180
