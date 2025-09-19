extends TextureRect

signal card_selected

@export var card_value:String
@export var card_front:Texture

var card_back : Texture


func flip():
	self.texture=card_back
	
func _ready() -> void:
	card_back=self.texture

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index==MOUSE_BUTTON_LEFT and event.pressed:
			self.texture=card_front
			card_selected.emit(self)
	
