extends CharacterBody2D

# Create a variable that finds the AnimatedSprite2D node in the SceneTree
@onready var animated_sprite_2d = $AnimatedSprite2D

const SPEED = 150.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
  # Add gravity
  if not is_on_floor():
    velocity.y += gravity * delta

  # Handle jump
  if Input.is_action_just_pressed("jump") and is_on_floor():
    velocity.y = JUMP_VELOCITY

  # Get the input direction, which can be -1 (left), 0 (neutral) or 1 (right)
  var direction = Input.get_axis("move_left", "move_right")

  # Flip the sprite depending on the player's current direction
  if direction == 1:
    animated_sprite_2d.flip_h = false
  elif direction == -1:
    animated_sprite_2d.flip_h = true

  # Play idle or run animations unless the player is in the air
  if is_on_floor():
    if direction == 0:
      animated_sprite_2d.play("idle")
    else:
      animated_sprite_2d.play("run")
  else:
    animated_sprite_2d.play("jump")

  # Apply player movement
  if direction:
    velocity.x = direction * SPEED
  else:
    velocity.x = move_toward(velocity.x, 0, SPEED)

  move_and_slide()
