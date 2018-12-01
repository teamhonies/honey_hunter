extends Node2D

var honey_added = 0
var honey_total = 4

var animation_name = "default"
var player_body = "Player"

signal honey_stashed

func _ready():
    get_node("Area2D").connect("body_entered", self, "_add_honey")
    
func _add_honey(body):
    if body.get_name() != player_body || honey_added == honey_total:
        return
    
    var owner = get_owner()
    if owner == null || !owner.has_honey:
        return 
    
    honey_added = honey_added + 1
    
    var update_frame = (honey_total / 2 == honey_added) || (honey_total == honey_added)
    if update_frame:
        var animation = get_node("AnimatedSprite")
        if animation.frames.get_frame_count(animation_name) > animation.frame:
            animation.frame = animation.frame + 1
    
    owner.has_honey = false
    emit_signal("honey_stashed")