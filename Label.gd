extends Label

var dayCounter : int = 0

func _ready():
	update_day_counter()

func update_day_counter():
	text = "Day: " + str(dayCounter)

func _on_Button_pressed():
	dayCounter += 1
	update_day_counter()
