extends Node2D

var card_matched=false
var selected_cards:Array


func _ready() -> void:
	selected_cards=[]

func card_clicked(selected_card):
	selected_cards.append(selected_card)
	if selected_cards.size()>=2:
		$FlipTimer.start()
		if selected_cards[0].card_value==selected_cards[1].card_value:
			print("they matched")
			card_matched=true
		else:
			print("they don't matched")
			card_matched=false
		


func _on_flip_timer_timeout() -> void:
	if card_matched==true:
		selected_cards[0].queue_free()
		selected_cards[1].queue_free()
	else:
		selected_cards[0].flip()
		selected_cards[1].flip()
	
	selected_cards=[]
	pass # Replace with function body.
