extends "res://Scripts/character.gd"

export (int) var speed = 200

var velocity = Vector2()
var player_position = Vector2()
var can_move_horizontally = true
var can_move_vertically = true
var facing_right
var flipped = false
var screensize

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
    
    if facing_right && !flipped:
        #flipped = true
        #get_node("AnimatedSprite").flip_h(flipped)
        print("fuck you")
        
    if !facing_right && flipped:
        #flipped = false
        #get_node("AnimatedSprite").flip_h(flipped)
        print("fuck you, too")
        
    velocity = velocity.normalized() * speed

func _process(delta):
    move()
    play_animation()
    position += velocity * delta
    position.x = clamp(position.x, 0, screensize.x)
    position.y = clamp(position.y, 0, screensize.y)
    
func _ready():
    set_animator("AnimatedSprite")
    change_state(IDLE)
    screensize = get_viewport_rect().size