extends "res://Scripts/character.gd"

export (int) var speed = 5

var velocity = Vector2()
var screensize

signal die

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

func _process(delta):
    get_input()
    var animation_modifier = ""
    
    if get_owner().has_honey:
        animation_modifier = "honey "
    
    play_animation(animation_modifier)
    velocity = velocity.normalized() * speed

func _physics_process(delta):
    var collision = move_and_collide(velocity)
    if collision && "bee_horse" in collision.collider.name:
        emit_signal("die")
        return

func _ready():
    set_animator("AnimatedSprite")
    change_state(IDLE)
    screensize = get_viewport_rect().size