extends TextureRect

var textures = {
	"pea": preload("res://assets/Pea/Untitled_Artwork-1.png"),
	"carrot": preload("res://assets/carrot.png")
}

func update_text(new_text: String):
	$RichTextLabel.text = new_text

func set_new_texture(textureName):
	$TextureRect6.set_texture(textures[textureName])
