extends Area2D

func _on_body_entered(body):
  # Notify the player they've picked up a coin
  print("+1 coin!")

  # Remove the Coin scene from the game
  queue_free()
