extends Area2D

# Create a variable that finds the Timer node in the SceneTree
@onready var timer = $Timer

"""This function gets triggered when the player enters a killzone."""
func _on_body_entered(body):
	# Notify the player they lost a life
	print("You died!")

	# Begin the death timer
	timer.start()

"""This function gets triggered by a death timer timeout."""
func _on_timer_timeout():
	# Reload the game
	get_tree().reload_current_scene()
