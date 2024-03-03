extends Label

var dayCounter : int = 0
var is_done : bool = true

var progressBar : ProgressBar
var debugPrintFrequency : float = 2.0
var elapsedDebugPrintTime : float = 0.0

func _ready():
	update_day_counter()
	progressBar = $ProgressBar  # Connect the ProgressBar node in the editor

func update_day_counter():
	text = "Day: " + str(dayCounter)

func _process(delta: float) -> void:
	elapsedDebugPrintTime += delta

	if elapsedDebugPrintTime >= debugPrintFrequency:
		print_debug($Timer.time_left)
		update_progress_bar()
		elapsedDebugPrintTime = 0.0

func update_progress_bar():
	if $Timer:
		var progressValue : float = $Timer.time_left / $Timer.wait_time
		progressBar.value = 1.0 - progressValue  # Invert the value for a decreasing effect
