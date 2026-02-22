extends CharacterBody2D
class_name Enemy

var player: Player

const speed = 100

var playerInRange = false

var timeBetweenAttacks = 2.0
var attackTimer = 0.0

func _ready():
	player = get_tree().root.get_node("Root/Player")

var prev_dir := Vector2(0,0)

func _physics_process(delta: float) -> void:
	var dir
	if (player and player.get_state() == 0):
		dir = (player.global_position - global_position).normalized()
	
		if attackTimer > 0:
			attackTimer -= delta
		
		if playerInRange and attackTimer <= 0:
			attack()
	
	if (!player or player.get_state() == 1):
		dir = (prev_dir + Vector2(randf(), randf())).normalized()
	
	velocity = speed * dir
	move_and_slide()


func attack():
	$AnimationPlayer.play("attack")
	attackTimer = timeBetweenAttacks

func _on_range_body_entered(body: Node2D) -> void:
	if body is Player:
		playerInRange = true

func modulate_sprite(color: Color):
	$Sprite2D.modulate = color
