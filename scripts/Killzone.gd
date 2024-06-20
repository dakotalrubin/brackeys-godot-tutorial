extends Area2D

# Create a variable that finds the Timer node in the SceneTree
@onready var timer = $Timer

"""This function gets triggered when the player enters a killzone."""
func _on_body_entered(body):
  # Notify the player they lost a life
  print("You died!")

  # Adjust the engine's time scale during player death
  Engine.time_scale = 0.5

  # Remove the collider on the player node
  body.get_node("CollisionShape2D").queue_free()

  # Begin the death timer
  timer.start()

"""This function gets triggered by a death timer timeout."""
func _on_timer_timeout():
  # Reset the engine's time scale after player death
  Engine.time_scale = 1.0

  # Reload the game
  get_tree().reload_current_scene()
