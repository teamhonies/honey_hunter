extends Node

var has_honey = false
var score = 0

func _on_HUD_start_game():
    $HUD.update_score(score)
    $HUD.show_message("Get Ready")

func game_over():
    $ScoreTimer.stop()
    $HUD.show_game_over()

func new_game():
    score = 0
    #$Player.start($StartPosition.position)
    $StartTimer.start()
    $HUD.update_score(score)
    $HUD.show_message("Get Ready")

func _on_StartTimer_timeout():
    print("START")
    $ScoreTimer.start()

func _on_ScoreTimer_timeout():
    score += 1
    $HUD.update_score(score)