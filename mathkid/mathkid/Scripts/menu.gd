extends Control

@onready var title: Label = $VBoxContainer/Title
@onready var description: Label = $VBoxContainer/Description
@onready var start_button: Button = $VBoxContainer/HBoxContainer/StartButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if(GlobalVariables.lifes <= 0):
		lifeCero_Gameover()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Boton Salir
func _on_exit_button_pressed() -> void:
	get_tree().quit()
	print("Gracias por jugar")

#Boton Comenzar 
func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Mundo_Principal/Mundo.tscn")
	print("Comenzate a jugar")
	
func lifeCero_Gameover():
	title.text = "Game Over"
	description.text = "¡Sigue intentado!, Realizaste un puntaje de: "+ str(GlobalVariables.score) +" Puntos!!, Vas por buen camino!!!!!!"
	start_button.text = "Reiniciar"
