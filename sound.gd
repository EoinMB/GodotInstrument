extends Node

var pitchV = 1

func _process(delta):
			
	$A.pitch_scale = pitchV
	$up.pitch_scale = pitchV
	$down.pitch_scale = pitchV
	$left.pitch_scale = pitchV
	$right.pitch_scale = pitchV
		
	if Input.is_action_just_pressed("A_button"):
		$A.play()
		
	if Input.is_action_just_pressed("up_button"):
		$up.play()
		
	if Input.is_action_just_pressed("down_button"):
		$down.play()
	
	if Input.is_action_just_pressed("left_button"):
		$left.play()
	
	if Input.is_action_just_pressed("right_button"):
		$right.play()

	#if Input.is_action_pressed("pitch_up"):
		#pitchV = 1.115
		#
	#if Input.is_action_pressed("pitch_down"):
		#pitchV = 0.85
		#
	#if not Input.is_action_pressed("pitch_up") and Input.is_action_pressed("pitch_down"):
		#pitchV = 1
	
	if Input.is_action_pressed("pitch_up"):
		pitchV = remap(Input.get_action_strength("pitch_up"), -1, 1, 0.885, 1.115)
		
	if Input.is_action_pressed("pitch_down"):
		pitchV = remap(Input.get_action_strength("pitch_down"), -1, 1, 1.115, 0.885)


##Drum Loops
	if Input.is_action_just_pressed("DrumUp"):
		$DrumUp.play()
