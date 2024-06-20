extends Node2D

# Reference the slime enemy's RayCastLeft and RayCastRight nodes
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft

# Reference the slime enemy's AnimatedSprite2D node
@onready var animated_sprite_2d = $AnimatedSprite2D

# The movement speed of the slime enemy in pixels per second
const SPEED = 60

# The direction of the slime enemy (default: moving right)
var direction = 1

"""This method is called every frame.
'delta' is the elapsed time since the previous frame."""
func _process(delta):
  # Check whether the slime enemy is colliding and change direction
  if ray_cast_right.is_colliding():
    direction = -1
    animated_sprite_2d.flip_h = true
  if ray_cast_left.is_colliding():
    direction = 1
    animated_sprite_2d.flip_h = false

  # Make the slime enemy's movement independent of the framerate
  position.x += direction * SPEED * delta
