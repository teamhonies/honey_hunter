extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

func movement(x,y):
	velocity.x = x
	velocity.y = y

func get_input():
    velocity = Vector2()
    if Input.is_action_pressed('ui_right'):
         movement(1,0) 
    if Input.is_action_pressed('ui_left'):
        movement(-1,0)
    if Input.is_action_pressed('ui_down'):
        movement(0,1)
    if Input.is_action_pressed('ui_up'):
        movement(0,-1)
    velocity = velocity.normalized() * speed

func _physics_process(delta):
    get_input()
    move_and_slide(velocity)