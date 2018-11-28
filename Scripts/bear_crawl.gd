extends "res://Scripts/character.gd"

export (int) var speed = 200

var velocity = Vector2()
var screensize

signal die
signal send_position(my_position)

func _should_die(body):
    if body.get_name() != "bee_horse":
        return
    emit_signal("die")

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
    play_animation()
    position += velocity * delta
    position.x = clamp(position.x, 0, screensize.x)
    position.y = clamp(position.y, 0, screensize.y)
    emit_signal("send_position", get_position())

func _ready():
    connect("area_entered", self, "_should_die")
    set_animator("AnimatedSprite")
    change_state(IDLE)
    screensize = get_viewport_rect().size