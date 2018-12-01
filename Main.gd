extends Node

var honey_gone = false
var has_honey = false
var score = 0

func _honey_stashed():
    if honey_gone == false:
        return
        
    $GameComponents.hide()
    $HUD.show_message("You fucking won")        
    $ScoreTimer.stop()

func _honey_gone():
    honey_gone = true
    

func _on_HUD_start_game():
    $HUD.update_score(score)
    $HUD.show_message("Get Ready")

func _on_Player_die():
    
    $GameComponents.hide()
    $ScoreTimer.stop()
    $HUD.show_game_over()
    $HUD.update_score(score)

func new_game():
    honey_gone = false
    has_honey = false
    score = 0

    $StartTimer.start()
    $GameComponents/Player.position = $Position2D.position
    $HUD.update_score(score)
    $HUD.show_message("Get Ready")

func _on_StartTimer_timeout():
    $GameComponents.show()
    $ScoreTimer.start()

func _on_ScoreTimer_timeout():
    score += 1
    $HUD.update_score(score)
    
func _ready():
    $GameComponents.hide()