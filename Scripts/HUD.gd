extends CanvasLayer

signal start_game

func show_message(text):
    $MessageLabel.text = text
    $MessageLabel.show()
    $MessageTimer.start()
    
func show_game_over(message):
    show_message(message)
    yield($MessageTimer, "timeout")
    $StartButton.show()
    
    $MessageLabel.text = "GET THE Honey!"
    $MessageLabel.show()
    
func update_score(score):
    $ScoreLabel.text = str(score)
    
func _on_StartButton_pressed():
    $StartButton.hide()
    emit_signal("start_game")

func _on_MessageTimer_timeout():
    $MessageLabel.hide()