extends CanvasLayer

@onready var life_label_count: Label = $Control/MarginContainer/VBoxContainer_Life/LifeLabelCount
@onready var score_label: Label = $Control/MarginContainer/VBoxContainer_Score/ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	life_label_count.text  = str(GlobalVariables.lifes)
	score_label.text = "Score: "+ str(GlobalVariables.score)
	
