extends Label

var dayCounter : int = 0
var is_done : bool = true

func _ready():
	update_day_counter()

func update_day_counter():
	text = "Day: " + str(dayCounter)
	
@warning_ignore("unused_parameter")
func _process(float) -> void:
	if !is_done and $CountdownTimer:
		$TextureProgressBar.value = $CountdownTimer.time_left
		#print_debug($CountdownTimer.time_left)  #TIMER LEFT DEBUG.

func _on_Button_pressed():
	if is_done:
		dayCounter += 1
		update_day_counter()
		is_done = false
		if $CountdownTimer:
			$CountdownTimer.start()

func _on_timer_timeout():
	if !is_done:
		update_day_counter()
		is_done = true
