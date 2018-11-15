extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()
var move_time_out = 5
func movement(x,y):
	velocity.x = x
	velocity.y = y

func choose_direction():
	var direction = randi()%4
	if direction == 0:
		movement(0,0)
	if direction == 1:
		movement(0,1)
	if direction == 2:
		movement(0,-1)
	if direction == 3:
		movement(1,0)
	if direction == 4:
		movement(-1,0)
	velocity = velocity.normalized() * speed

func move_horse():
	if move_time_out == 0:
		choose_direction()
		move_time_out = 5
	move_time_out = move_time_out - 1

func _physics_process(delta):
    choose_direction()
    move_and_slide(velocity)