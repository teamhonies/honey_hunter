extends KinematicBody2D

export (int) var speed = 200
enum {IDLE, LEFT, RIGHT, UP, DOWN}

var velocity = Vector2()
var animator
var animation
var new_animation

func change_state(state):
	match state:
		IDLE:
			new_animation = 'idle'
		LEFT:
			new_animation = 'walk left'
		RIGHT:
			new_animation = 'walk right'
		UP:
			new_animation = 'walk up'
		DOWN:
			new_animation = 'walk down'

func movement(x,y):
	velocity.x = x
	velocity.y = y

func get_input():
    velocity = Vector2()
    var new_state = IDLE

    if Input.is_action_pressed('ui_right'):
        new_state = RIGHT
        movement(1,0) 

    if Input.is_action_pressed('ui_left'):
        new_state = LEFT
        movement(-1,0)

    if Input.is_action_pressed('ui_down'):
        new_state = DOWN
        movement(0,1)

    if Input.is_action_pressed('ui_up'):
        new_state = UP
        movement(0,-1)

    change_state(new_state)
    velocity = velocity.normalized() * speed

func _ready():
    animator = get_node("AnimatedSprite")
    change_state(IDLE)

func _process(delta):
    get_input()
    if new_animation != animation:
        animation = new_animation
        animator.play(animation)

func _physics_process(delta):
    move_and_slide(velocity)