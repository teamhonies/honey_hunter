extends "res://Scripts/character.gd"

export (int) var speed = 200

var velocity = Vector2()
var flipped = false
var screensize

signal player_killed

func movement_x(x):
    velocity = Vector2(x, 0)

func choose_direction():
    if flipped:
        movement_x(-10)
    else:
        movement_x(10)

func move():
    velocity = velocity.normalized() * speed

func _process(delta):
    change_state(MOVE)
    play_animation("")
    choose_direction()    

func _physics_process(delta):
    var collision = move_and_collide(velocity)
    
    if collision:
        if (collision.collider.name == "bear_crawl" || collision.collider.name == "Player"):
            print(collision.collider.name)
            emit_signal("player_killed")
        flipped = !flipped
        get_node("AnimatedSprite").set_flip_h(!flipped)
    
func _ready():
    set_animator("AnimatedSprite")
    change_state(IDLE)
    screensize = get_viewport_rect().size