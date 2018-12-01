extends Node

var honey_gone = false
var has_honey = false
var score = 0

func _reset_game():
    $"GameComponents/Objects/honey pot".reset()
    $"GameComponents/Objects/honey dripper".reset()
    $GameComponents/Player.position = $Position2D.position
    score = 0
    has_honey = false
    honey_gone = false

func _game_over(game_over_message):
    _reset_game()
    
    $GameComponents.hide()
    $ScoreTimer.stop()
    $HUD.show_game_over(game_over_message)
    $HUD.update_score(score)
    
func _honey_stashed():
    if honey_gone == false:
        return
        
    _game_over("You done won")

func _honey_gone():
    honey_gone = true

func _on_HUD_start_game():
    $HUD.update_score(score)
    $HUD.show_message("Get Ready")

func _on_Player_die():
    _game_over("You done got killed")

func new_game():
    _reset_game()
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

func _player_killed():
     _game_over("You done got killed")
    
func _process(delta):
    if Input.is_action_pressed('ui_cancel'):
        _game_over("Why you quitting?")