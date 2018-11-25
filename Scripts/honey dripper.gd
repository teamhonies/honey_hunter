extends Node2D

var honey_scale = 4
var honey_left = 4

func ready():
    honey_left = honey_scale
    #get_node("Area2D").connect("body_enter", self, "_collect_honey")
    
func _collect_honey(body):
    if body.get_name() != "bear_spider":
        pass
        
    if honey_left == 0:
        pass
        
    var owner = get_owner()
    if owner != null && !owner.has_honey:
        owner.has_honey = true
        honey_left = honey_left - 1
        if honey_scale / 2 == honey_left:
            var animation = get_node("AnimatedSprite")
            honey_scale = honey_left
            var current_frame = animation.get_frame()
            if animation.get_hframes() > current_frame:
                animation.set_frame(current_frame + 1)