extends Node2D

var honey_scale = 4
var honey_left = 0

var animation_name = "default"
var player_body = "bear_spider"

func _ready():
    honey_left = honey_scale
    get_node("Area2D").connect("body_entered", self, "_collect_honey")
    
func _collect_honey(body):
    if body.get_name() != player_body:
        pass
        
    if honey_left == 0:
        pass
        
    var owner = get_owner()
    if owner != null || owner.has_honey:
        pass
        
    owner.has_honey = true
    honey_left = honey_left - 1
    if (honey_scale / 2 >= honey_left || honey_left == 0):
        var animation = get_node("AnimatedSprite")
        honey_scale = honey_left
        if animation.frames.get_frame_count(animation_name) > animation.frame:
            animation.frame = animation.frame + 1