extends Node

@export var next_scene_path: String = "res://world.tscn"

@onready var author: Label = $Label
@onready var ricehut: Node = $Ricehut
@onready var inside: Node = $intothericehut
@onready var text: RichTextLabel = $RichTextLabel

var dialogue: Array = []
var dialogue_index: int = 0
var dialogue_active: bool = false

func _ready() -> void:
	setup_dialogue()
	start_dialogue()

func _process(_delta: float) -> void:
	if dialogue_active and (Input.is_action_just_pressed("knife") or Input.is_action_just_pressed("shootMSG") or Input.is_action_just_pressed("drinkSoySauce")):
		next_line()
	if Input.is_action_just_pressed("coin"):
		switch_to_scene(next_scene_path)

# ---------------------------------------
# Dialogue Setup
# ---------------------------------------

func setup_dialogue() -> void:
	dialogue = [
		{ "speaker": "Dayvon", "color": Color.GREEN, "text": "At last." },
		{ "speaker": "", "color": Color.WHITE, "text": "Standing in front of the modest but gleaming newly constructed restaurant, Dayvon’s eyes glimmer with the anticipation of fulfillment to come." },
		{ "speaker": "", "color": Color.WHITE, "text": "Years of saving, hard work and a few high-interest loans taken out from the local Blahaj Shack, and the first step towards living his dream was taken – a beautiful kitchen stands before him, ready for countless servings of fried rice to be cooked up and served." },
		{ "speaker": "", "color": Color.WHITE, "text": "Sacks of freshly grown vegetables and rice, only of the highest quality from the local farmer’s market, ship into the kitchen’s pantry as Dayvon prepares to open shop." },
		{ "speaker": "", "color": Color.WHITE, "text": "And as the door opens, the small dining area floods with patrons, all there for one simple dish – egg fried rice." },
		{ "speaker": "", "color": Color.WHITE, "text": "Preparing the wok, the chef turns to the pantry to start chopping up ingredients for his hungry customers." },
		{ "speaker": "", "color": Color.WHITE, "text": "And yet the scallions begin moving with a will of their own." },
		{ "speaker": "", "color": Color.WHITE, "text": "The bags of frozen peas spill onto the ground, the legumes rising up in defiance against he who was about to throw their cold bodies into the fiery hot pan." },
		{ "speaker": "", "color": Color.WHITE, "text": "The carrots fling themselves at the chef in defense of their multicolored brothers." },
		{ "speaker": "", "color": Color.WHITE, "text": "Even the grains of rice form blockades, trying to halt the advance of their incoming doom." },
		{ "speaker": "", "color": Color.WHITE, "text": "Yet the customers must be served. They must eat that Dayvon might receive coin that he might repay his debts." },
		{ "speaker": "", "color": Color.WHITE, "text": "He won’t let the sharks eat him." }
	]

func start_dialogue() -> void:
	ricehut.visible = true
	inside.visible = false
	dialogue_index = 0
	dialogue_active = true
	show_line()

func next_line() -> void:
	dialogue_index += 1
	
	if dialogue_index >= dialogue.size():
		dialogue_active = false
		on_dialogue_finished()
		return
	
	show_line()

func show_line() -> void:
	var line = dialogue[dialogue_index]
	
	text.text = line["text"]
	
	if line["speaker"] != "":
		author.text = line["speaker"]
		author.modulate = line["color"]
	else:
		author.text = ""

func on_dialogue_finished() -> void:
	switch_to_scene(next_scene_path)

func switch_to_scene(path: String) -> void:
	get_tree().change_scene_to_file(path)
	
#dokivn decided to be unhelpful so :brokenheart:
