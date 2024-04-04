extends CanvasLayer
@export var font : Font = null
var scene_text_file: String = "res://Dialogos/goblin_dialogs.json"
var rng = RandomNumberGenerator.new()
var scene_text = {}
var selected_text = []
var selected_face = []
var in_progress = false
var aux = false

@onready var background = $Background
@onready var text_label = $TextLabel
@onready var retrato = $Retrato

func set_dialog_route(route):
	scene_text_file = route


func _ready():
	background.visible = false
	scene_text = load_scene_text()
	SignalBus.display_dialog.connect(on_display_dialog)
	#text_label.push_font(font,20)
	text_label.text = ""



func load_scene_text():
	#var file = FileAccess.open(scene_text_file, FileAccess.READ)
	var json_as_text = FileAccess.get_file_as_string(scene_text_file)
	var json_as_dict = JSON.parse_string(json_as_text)
	print(json_as_dict)
	return json_as_dict
		

func set_text_with_font(text):
	text_label.text = text
	#text_label.push_font(font,20)

func show_text():
	set_text_with_font(selected_text.pop_front())
	var texture: Texture2D = load(selected_face.pop_front())
	retrato.texture = texture
	$AnimateText.seek(0,true,true)
	$AnimateText.play("text")
	

func next_line():
	if selected_text.size() > 0:
		show_text()
	else:
		finish()

func finish():
	text_label.text = ""
	$AnimationPlayer.play("new_animation",-1,-3,true)
	in_progress = false
	get_tree().paused = false

var haz_el_tween = false

func on_display_dialog(text_key):
	if in_progress:
		if($AnimateText.is_playing()):
			$AnimateText.seek(0.9,true,true)
			print("he ido pal final")
		else:	
			print("he saltado")
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
		$AnimateText.play("text")

		


