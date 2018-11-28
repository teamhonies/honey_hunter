extends Node

var has_honey = false
var score = 0

func _on_HUD_start_game():
    $HUD.update_score(score)
    $HUD.show_message("Get Ready")


func _on_Player_die():
    $GameComponents.hide()
    $ScoreTimer.stop()
    $HUD.show_game_over()
    $HUD.update_score(score)

func new_game():
    score = 0
    $StartTimer.start()
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