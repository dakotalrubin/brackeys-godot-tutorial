extends Area2D

# Create a variable that finds the GameManager node in the SceneTree
@onready var game_manager = %GameManager

# Create a variable that finds the AnimationPlayer node in the SceneTree
@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
  # Increment the score when the player picks up a coin
  game_manager.add_point()

  # Play an animation that plays the coin pickup sound and removes the Coin
  # scene from the game
  animation_player.play("pickup")
