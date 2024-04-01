extends CanvasLayer

@export var scene_text_file: String = "*json"
var rng = RandomNumberGenerator.new()
var scene_text = {}
var selected_text = []
var selected_face = []
var in_progress = false

@onready var background = $Background
@onready var text_label = $TextLabel
@onready var retrato = $Background/Retrato

func _ready():
	background.visible = false
	scene_text = load_scene_text()
	SignalBus.display_dialog.connect(on_display_dialog)
	text_label.text = ""


func load_scene_text():
	#var file = FileAccess.open(scene_text_file, FileAccess.READ)
	var json_as_text = FileAccess.get_file_as_string(scene_text_file)
	var json_as_dict = JSON.parse_string(json_as_text)
	print(json_as_dict)
	return json_as_dict
		

func show_text():
	text_label.text = selected_text.pop_front()
	var texture: Texture2D = load(selected_face.pop_front())
	retrato.texture = texture
	

func next_line():
	if selected_text.size() > 0:
		show_text()
	else:
		finish()

func finish():
	text_label.text = ""
	background.visible = false
	in_progress = false
	get_tree().paused = false

var haz_el_tween = false
func on_display_dialog(text_key):

	if in_progress:
		next_line()
	else:
		get_tree().paused = true
		background.visible = true
		in_progress = true
		selected_text = scene_text[text_key].duplicate()
		var img_key = text_key+"_faces"
		selected_face = scene_text[img_key].duplicate()
		show_text()
		$AnimationPlayer.play("new_animation",-1,3)
		

