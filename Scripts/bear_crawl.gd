extends "res://Scripts/character.gd"

export (int) var speed = 200

var velocity = Vector2()

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

func _physics_process(delta):
    move_and_slide(velocity)

func _process(delta):
    get_input()
    play_animation()

func _ready():
    set_animator("AnimatedSprite")
    change_state(IDLE)
