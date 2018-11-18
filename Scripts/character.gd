extends KinematicBody2D

enum {IDLE, LEFT, RIGHT, UP, DOWN, MOVE, ATTACK}

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
        MOVE:
            new_animation = 'move'
        ATTACK:
            new_animation = 'attack'

func play_animation():
    if new_animation != animation:
        animation = new_animation
        animator.play(animation)

func set_animator(animator_name):
    animator = get_node("AnimatedSprite")