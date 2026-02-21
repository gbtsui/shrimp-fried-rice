extends CharacterBody2D
class_name Player

var downHeld: int = 0
var upHeld: int = 0
var leftHeld: int = 0
var rightHeld: int = 0

const speed = 200

@onready var stateManager = $PlayerStateManager
@onready var healthManager = $HealthManager

func _ready():
	stateManager.change_state(0)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("down"): downHeld = 1
	elif event.is_action_released("down"): downHeld = 0
	if event.is_action_pressed("up"): upHeld = 1
	elif event.is_action_released("up"): upHeld = 0
	if event.is_action_pressed("left"): leftHeld = 1
	elif event.is_action_released("left"): leftHeld = 0
	if event.is_action_pressed("right"): rightHeld = 1
	elif event.is_action_released("right"): rightHeld = 0

func move():
	var yDir = downHeld - upHeld
	var xDir = rightHeld - leftHeld
	
	var dir = Vector2(xDir, yDir)
	
	velocity = dir * speed
	move_and_slide()

func _physics_process(delta: float) -> void:
	if stateManager.current_state == 0: move()

func get_state():
	return stateManager.current_state

func modulate_sprite(color: Color):
	$CanvasLayer/Sprite2D.modulate = color
