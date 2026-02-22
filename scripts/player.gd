extends CharacterBody2D
class_name Player

var downHeld: int = 0
var upHeld: int = 0
var leftHeld: int = 0
var rightHeld: int = 0

const starting_hp = 10.0

const baseKnifeDamage = 2.5
const baseSpeed = 200

var knifeDamage = baseKnifeDamage
var speed = baseSpeed

@onready var stateManager = $PlayerStateManager
@onready var healthManager = $HealthManager

var closest_enemy: Enemy
var dir_to_closest_enemy: Vector2

func _ready():
	stateManager.change_state(0)
	healthManager.max_hp = starting_hp

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("down"): downHeld = 1
	elif event.is_action_released("down"): downHeld = 0
	if event.is_action_pressed("up"): upHeld = 1
	elif event.is_action_released("up"): upHeld = 0
	if event.is_action_pressed("left"): leftHeld = 1
	elif event.is_action_released("left"): leftHeld = 0
	if event.is_action_pressed("right"): rightHeld = 1
	elif event.is_action_released("right"): rightHeld = 0
	
	if event.is_action_pressed("knifeAttack") and !$AnimationPlayer.is_playing(): $AnimationPlayer.play("attack")

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

func isEnemy(element):
	return element is Enemy

func _process(delta: float) -> void:
	get_closest_enemy()
	if (closest_enemy):
		dir_to_closest_enemy = closest_enemy.global_position - global_position
		$KnifePivot.look_at(closest_enemy.global_position)
	else:
		dir_to_closest_enemy = Vector2.ZERO
	
	if (dir_to_closest_enemy.x > 0): $CanvasLayer/Sprite2D.flip_h = true
	else: $CanvasLayer/Sprite2D.flip_h = false
	
	if !$AnimationPlayer.is_playing(): $AnimationPlayer.play("idle")
	# make this run on a timer later.

func get_closest_enemy():
	var enemies_array = get_tree().root.get_node("Root").get_children().filter(isEnemy)
	var closest_distance: float = INF
	for enemy in enemies_array:
		var dist = (enemy.global_position - global_position).length()
		if dist < closest_distance:
			closest_distance = dist
			closest_enemy = enemy
	if (enemies_array.size() == 0): closest_enemy = null


func _on_knife_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.get_node("HealthManager").damage(knifeDamage)
