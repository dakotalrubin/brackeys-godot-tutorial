extends Node

# Create a variable that finds the ScoreLabel node in the SceneTree
@onready var score_label = $ScoreLabel

# Create a variable to track the player's current score
var score = 0

"""This function increments the player's score and updates the display."""
func add_point():
  score += 1
  score_label.text = "You collected " + str(score) + " coin(s)!"
