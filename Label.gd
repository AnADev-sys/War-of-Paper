extends Label

func _ready():
	text = "Se prepare!..."
	yield(get_tree().create_timer(1.0), "timeout") # Espera 1 segundo
 
	for i in range(1, 4):
		text = str(i)
		yield(get_tree().create_timer(1.0), "timeout") # Espera 1 segundo a cada número

	text = "Já!"
