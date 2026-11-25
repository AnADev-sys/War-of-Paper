extends Spatial

onready var anim_player: AnimationPlayer = $RootNode/HumanArmature/AnimationPlayer

# Variáveis para controlar a rotação com o rato
var esta_a_girar: bool = false
var velocidade_rotacao: float = 0.005

func _ready() -> void:
	if anim_player:
		print("Animações encontradas: ", anim_player.get_animation_list())
		tocar_animacao("HumanArmature|Man_Idle")
	else:
		print("Erro: AnimationPlayer não encontrado.")

func _unhandled_input(event: InputEvent) -> void:
	# Controlo das animações pelas teclas 1, 2, 3, 4
	if event is InputEventKey and event.pressed:
		match event.scancode:
			KEY_1:
				tocar_animacao("HumanArmature|Man_Idle")
			KEY_2:
				tocar_animacao("HumanArmature|Man_Walk") # (ou Mantém Man_Walk)
			KEY_3:
				tocar_animacao("HumanArmature|Man_Run")
			KEY_4:
				tocar_animacao("HumanArmature|Man_Punch")

	# Deteta quando clicas com o botão esquerdo do rato
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			esta_a_girar = event.pressed

	# Roda o boneco quando o rato se move a arrastar
	if event is InputEventMouseMotion and esta_a_girar:
		rotation.y -= event.relative.x * velocidade_rotacao

func tocar_animacao(nome_anim: String) -> void:
	if anim_player and anim_player.has_animation(nome_anim):
		anim_player.play(nome_anim)
		
		var anim = anim_player.get_animation(nome_anim)
		if anim:
			anim.loop = true
			
		print("A tocar em loop: ", nome_anim)
	else:
		print("Animação não encontrada: ", nome_anim)
