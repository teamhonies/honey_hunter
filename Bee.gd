extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()
var player_position = Vector2()
var can_move_horizontal = true
var can_move_vertically = true

func set_player_position(x,y):
	player_position.x = x
	player_position.y = y

func movement_x(x):
	velocity.x = x
	velocity.y = 0

func movement_y(y):
	velocity.x = 0
	velocity.y = y
	
func vertical_direction():
	if player_position.y <  current_position.y:
		movement_y(-1)

	if player_position.y > current_position.y:
		movement_y(1)

func horizontal_direction():
	if player_position.x <  current_position.x:
		movement_x(-1)

	if player_position.x > current_position.x:
		movement_x(1)

func choose_direction():
	var current_position = get_position()

	should_move_vertically = player_position.y != current_position.y
	should_move_horizontally = player_position.x != current_position.x
	
	if can_move_vertically && should_move_vertically:
		vertical_direction()
		return

	if can_move_horizontally && should_move_horizontally
		horizontal_direction()
		return

func move():
	choose_direction()
	velocity = velocity.normalized() * speed

func _physics_process(delta):
    move()
    move_and_slide(velocity)