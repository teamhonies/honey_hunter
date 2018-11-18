extends "res://Scripts/character.gd"

export (int) var speed = 200

var velocity = Vector2()
var player_position = Vector2()
var can_move_horizontally = true
var can_move_vertically = true
var facing_right

func _on_bear_spider_send_position(position):
    player_position = position
    
func movement_x(x):
    velocity.x = x
    velocity.y = 0

func movement_y(y):
    velocity.x = 0
    velocity.y = y
        
func vertical_direction(current_position):
    if player_position.y <  current_position.y:
        movement_y(-1)
    if player_position.y > current_position.y:
        movement_y(1)

func horizontal_direction(current_position):
    if player_position.x <  current_position.x:
        facing_right = false
        movement_x(-1)
    if player_position.x > current_position.x:
        facing_right = true
        movement_x(1)

func choose_direction():
    var current_position = get_position()

    var should_move_vertically = player_position.y != current_position.y
    var should_move_horizontally = player_position.x != current_position.x

    if can_move_vertically && should_move_vertically:
        vertical_direction(current_position)
        return
    if can_move_horizontally && should_move_horizontally:
        horizontal_direction(current_position)
        return

func move():
    choose_direction()
    change_state(MOVE)
    
    if facing_right:
        set_scale(Vector2(-1,1))
    else:
        set_scale(Vector2(1,1))
    
    velocity = velocity.normalized() * speed

func _process(delta):
    play_animation()

func _physics_process(delta):
    move()
    move_and_slide(velocity)
    
func _ready():
    set_animator("AnimatedSprite")
    change_state(IDLE)
