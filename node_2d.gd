extends Node

var s := Scripted.new()
var shrimp : VNChar
var loanshark : VNChar
var placeholder: VNChar
@onready var author = $Label
@onready var ricehut = $Ricehut
@onready var inside = $intothericehut
@onready var text = $RichTextLabel



func _init() -> void:
	s.from = self
	shrimp = s.character().name("Molton").color(Color.GREEN)
	loanshark = s.character().name("Loan Shark").color(Color.AQUA)

func _on_name(response : String) -> void:
	s.layer_init()
	s.alert("Hello, %s!" % response)
	s.layer_start()
	return


func _on_no() -> void:
	s.layer_init()
	shrimp.says("Sorry! :(")
	s.layer_start()
	s.resume()

func _ready() -> void:
	
	onstart()
	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		s.confirm.emit()	#Skip Dialogs

	text.text = s.text_output
	text.modulate.a = s.opacity_output
	text.visible_ratio = s.vrat_output
	
	author.text = s.get_character().attr_name if s.get_character() != null else ""
	author.modulate = s.get_character().attr_color if s.get_character() != null else Color.WHITE
	author.modulate.a = s.opacity_output

func sequence2 () -> void:
	s.says("The bustling restaurant is an immediate success, with customers lining up out the door for a taste of Dayvon's cooking. Despite the chaos in the kitchen, the chef is, at least from the outside, managing operations and cuisine perfectly.")
	s.says("Business as usual outside. A few loaners have dropped in, interested in a bit more than the looming payments. Seeing his debtors, Dayvon hurries out of the kitchen, knife sheathed in the back of his apron.")
	shrimp.says("Good afternoon, gentlemen. Might I assist you with anything?")
	loanshark.says("gwan bruh heard your cooking lwk fire")
	
func sequence3 () -> void:
	s.says("")
	

func onstart() -> void:
	ricehut.visible = true
	inside.visible = false
	shrimp.says("Finally… I did it…")
	s.says("Standing in front of the modest but gleaming newly constructed restaurant, Dayvon's eyes glimmer with the anticipation of fulfillment to come.")
	s.says("Years of saving, hard work and a few high-interest loans taken out from the local Blahaj Shack, and the first step towards living his dream was taken – a beautiful kitchen stands before him, ready for countless servings of fried rice to be cooked up and served.")
	s.says("Sacks of freshly grown vegetables and rice, only of the highest quality from the local farmer's market, ship into the kitchen's pantry as Dayvon prepares to open shop.")
	s.says("egg fried rice")
	inside.visible = true
	s.says("And as the door opens, the small dining area floods with patrons, all there for one simple dish")
	s.says("Preparing the wok, the chef turns to the pantry to start chopping up ingredients for his hungry customers.")
	s.says("And yet the scallions begin moving with a will of their own. The bags of frozen peas spill onto the ground, the legumes rising up in defiance against he who was about to throw their cold bodies into the firey hot pan.")
	s.says("The carrots fling themselves at the chef in defense of their multicolored brothers. Even the grains of rice form blockades, trying to halt the advance of their incoming doom.")
	s.says("Yet the customers must be served. They must eat that Dayvon might receive coin that he might repay his debts.")
	s.says("He won't let the sharks eat him.")
	s.start()
