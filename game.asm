#####################################################################
#
# CSCB58 Winter 2023 Assembly Final Project
# University of Toronto, Scarborough
#
# Student: Name, Student Number, UTorID, official email
#
# Bitmap Display Configuration:
# - Unit width in pixels: 4 (update this as needed)
# - Unit height in pixels: 4 (update this as needed)
# - Display width in pixels: 512 (update this as needed)
# - Display height in pixels: 512 (update this as needed)
# - Base Address for Display: 0x10008000 ($gp)
#
# Which milestones have been reached in this submission?
# (See the assignment handout for descriptions of the milestones)
# - Milestone 1,2,3 all done
#
# Which approved features have been implemented for milestone 3?
# (See the assignment handout for the list of additional features)
# 1. health
# 2. Fail condition
# 3. Win condition
# 4. Moving Platforms
# 5. Pick-up effects
# 6. Double jump
#
# Link to video demonstration for final submission:
# - (insert YouTube / MyMedia / other URL here). Make sure we can view it!
#
# Are you OK with us sharing the video with people outside course staff?
# - yes, and please share this project github link as well!
# github link: https://github.com/Xpereze/Assembly-Platform-Game.git
#
# Any additional information that the TA needs to know:
# - (write here, if any)
#
#####################################################################
.data
	player_a: .word 15880
	black: .word 0x000000
	lighter_black: .word 0x202020
	white: .word 0xffffff
	red: .word 0xff0000
	dblue: .word 0x000099
	gray: .word  0x808080
	green: .word  0x33ff33
	gold: .word 0xffd700
	center: .word 10340
	midj: .word 0
	beginning: .word 4476
.eqv BASE_ADDRESS 0x10008000
.text
	li $t0, BASE_ADDRESS # $t0 stores the base address for display
	




Base:
	add $t5, $zero, 1
	add $t6, $zero, 62
	#restart
	add $t2,$t0,0
	add $t3, $t0,16384
	screen:
		lw $t4, black
		beq $t2, $t3,floor
	
		sw $t4, ($t2)
		add $t2,$t2,4
		j screen
	#floor
	add $t2,$t0,16128
	add $t3, $t0,16384
	floor:
		add $t2,$t0,16128
		add $t3, $t0,16384
		base_plat:
			lw $t4, dblue
			beq $t2, $t3,platforms
	
			sw $t4, ($t2)
			add $t2,$t2,4
			j base_plat
	
	platforms:
	
	#flag
	lw $t4, lighter_black
	sw $t4, 2564($t0)
	sw $t4, 2308($t0)
	sw $t4, 2052($t0)
	sw $t4, 1796($t0)
	sw $t4, 1540($t0)
	sw $t4, 1284($t0)
	sw $t4, 1028($t0)
	lw $t4, gold
	sw $t4, 1288($t0)
	sw $t4, 1032($t0)
	sw $t4, 1292($t0)
	sw $t4, 1036($t0)
	# platform 1
	lw $t4, dblue
	
	sw $t4, 14352($t0)
	sw $t4, 14356($t0)
	sw $t4, 14360($t0)
	sw $t4, 14364($t0)
	sw $t4, 14368($t0)
	sw $t4, 14372($t0)
	sw $t4, 14376($t0)
	sw $t4, 14380($t0)
	# platform 2
	lw $t4, dblue
	
	sw $t4, 13356($t0)
	sw $t4, 13360($t0)
	sw $t4, 13364($t0)
	sw $t4, 13368($t0)
	sw $t4, 13372($t0)
	sw $t4, 13376($t0)
	sw $t4, 13380($t0)
	sw $t4, 13384 ($t0)
	sw $t4, 13388 ($t0)
	sw $t4, 13392 ($t0)
	# platform 3
	
	lw $t4, dblue
	
	add $t2,$t0,12364
	add $t3, $t0,12444
	plat3:
		
		add $t2,$t2,4
		lw $t4, dblue
		sw $t4, ($t2)
		bne $t2, $t3,plat3
	
	
	
	
	add $t2,$t0,13464
	add $t3, $t0,13508
	uplat1:
		
		add $t2,$t2,4
		lw $t4, dblue
		sw $t4, ($t2)
		bne $t2, $t3,uplat1
	
	
	add $t2,$t0, 14528
	add $t3, $t0,14564
	uplat2:
		
		add $t2,$t2,4
		lw $t4, dblue
		sw $t4, ($t2)
		bne $t2, $t3,uplat2
	add $t2,$t0, 512
	add $t3, $t0,640
	uplat5:
		
		add $t2,$t2,4
		lw $t4, dblue
		sw $t4, ($t2)
		bne $t2, $t3,uplat5
	#health bar
	lw $t4, green
	sw $t4, 260($t0)
	sw $t4, 268($t0)
	sw $t4, 276($t0)
	lw $t4, red
	sw $t4, 284($t0)
	sw $t4, 292($t0)
	sw $t4, 300($t0)
	
	# health replenish powerup
	lw $t4, green
	sw $t4, 8064($t0)
	sw $t4, 8068($t0)
	sw $t4,  8072($t0)
	
	
	# mid platform (4)
	lw $t4, dblue
	add $t2,$t0, 8192
	add $t3, $t0,8288
	uplat3:
		
		add $t2,$t2,4
		lw $t4, dblue
		sw $t4, ($t2)
		bne $t2, $t3,uplat3
	sw $t4, 8300($t0)
	sw $t4, 8304($t0)
	sw $t4, 8308($t0)
	sw $t4, 8312($t0)
	sw $t4,  8316($t0)
	sw $t4, 8320($t0)
	sw $t4  8324($t0)
	sw $t4, 8328($t0)
	sw $t4, 8332($t0)
	sw $t4, 8336($t0)
	sw $t4, 8340($t0)
	
	#platform 5
	lw $t4, dblue

	sw $t4, 7060($t0)
	sw $t4, 7064($t0)
	sw $t4, 7068($t0)
	sw $t4, 7072($t0)
	sw $t4, 7076($t0)
	sw $t4, 7080 ($t0)
	sw $t4, 7084 ($t0)
	sw $t4, 7088 ($t0)
	sw $t4, 7092 ($t0)
	sw $t4, 7096 ($t0)
	sw $t4, 7100 ($t0)
	sw $t4, 7104 ($t0)
	sw $t4, 7108 ($t0)
	sw $t4, 7112($t0)
	sw $t4, 7116($t0)
	sw $t4, 7120($t0)
	
	#double jump one time power up
	lw $t4, gray
	sw $t4, 12124($t0)
	#armor
	lw $t4, gold
	sw $t4, 6828 ($t0)
	sw $t4, 6572 ($t0)
	sw $t4, 6316 ($t0)
	lw $t4, green
		
	# platform 6
	lw $t4, dblue
	add $t2,$t0, 5628
	add $t3, $t0,5764
	uplat4:
		
		add $t2,$t2,4
		lw $t4, dblue
		sw $t4, ($t2)
		bne $t2, $t3,uplat4
	sw $t4, 5756 ($t0)
	sw $t4, 5760($t0)
	sw $t4, 5764 ($t0)
	sw $t4, 5768($t0)
	
	sw $t4, 5784($t0)
	sw $t4, 5788($t0)
	sw $t4, 5792($t0)
	sw $t4, 5796($t0)
	sw $t4, 5800 ($t0)
	sw $t4, 5804 ($t0)
	sw $t4, 5808 ($t0)
	sw $t4, 5812 ($t0)


	
	sw $t4, 5840($t0)
	sw $t4, 5844($t0)
	sw $t4, 5848 ($t0)
	sw $t4, 5852 ($t0)
	sw $t4, 5856 ($t0)
	sw $t4, 5860($t0)
	sw $t4, 5864($t0)
	sw $t4, 5868 ($t0)
	sw $t4, 5872 ($t0)
	sw $t4, 5876 ($t0)
	sw $t4, 5880($t0)
	sw $t4, 5884($t0)
	#damaging cubes
	lw $t4, red
	sw $t4, 5540($t0)
	sw $t4, 5544($t0)
	sw $t4, 5548($t0)
	
	#final platform
	add $t2,$t0,2812
	add $t3, $t0,2944
	final_plat:
		
		add $t2,$t2,4
		lw $t4, dblue
		sw $t4, ($t2)
		bne $t2, $t3,final_plat
	
		
	add $t2, $zero, 15876 #first position
	add $t3,$t2, 0
	player:
		lw $t4, white
		add $t2,$t3,$t0
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		sub  $t2, $t2, 256  # Add 256 to the offset value
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		sub $t2, $t2, 256  # Add 256 to the offset value
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		sub $t2, $t2, 256  # Add 256 to the offset value
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		add $t2, $t3, 0
	
	
	
	
	##movement
	movement:
	
		li $t9, 0xffff0000
		lw $t8, 0($t9)
		beq $t8, 1, keypress_happened
		jal moving_1
		jal moving_2
		jal replenish
		jal damage
		jal armor
		jal double
		jal won
		li $v0, 32
		li $a0, 40 # Wait one second (1000 milliseconds)
		syscall
		
		j gravity
		
	keypress_happened:
		lw $t7, 4($t9) # this assumes $t9 is set to 0xfff0000 from before
		beq $t7, 0x61, respond_to_a # ASCII code of 'a' is 0x61 or 97 in decimal
		beq $t7, 0x64, respond_to_d # ASCII code of 'a' is 0x61 or 97 in decimal
		beq $t7, 0x77, respond_to_w # ASCII code of 'a' is 0x61 or 97 in decimal
		beq $t7, 0x70, end_p
		syscall
		j movement
		
	double:
		lw $t4, gray
		sw $t4, 12124($t0)
		beq $t3, 12124, double_found
		jr $ra
		double_found:
			lw $t4, black
			add $t7, $t0, 316
			lw $t2, ($t7)
			beq $t4, $t2, double_jump
			jr $ra
	double_jump:
		lw $t4, gray
		sw $t4, 316 ($t0)
		jr $ra
	damage:
		lw $t4, red
		sw $t4, 5540($t0)
		sw $t4, 5544($t0)
		sw $t4, 5548($t0)
		lw $t4, white
		lw $t4, gold
		add $t7, $t0, 308
		lw $t2, ($t7)
		beq $t4, $t2, shielded

		beq $t3, 5540,hurt
		beq $t3, 5544, hurt
		beq $t3, 5548, hurt
		jr $ra
	shielded:
		jr $ra
	hurt:
		
		lw $t4, green
		add $t7, $t0, 300
		lw $t2, ($t7)
		beq $t4, $t2, damaged
		add $t7, $t0, 292	
		lw $t2, ($t7)
		beq $t4, $t2, damaged
		add $t7, $t0, 284
		lw $t2, ($t7)
		beq $t4, $t2, damaged
		add $t7, $t0, 276
		lw $t2, ($t7)
		beq $t4, $t2, damaged
		add $t7, $t0, 268
		lw $t2, ($t7)
		beq $t4, $t2, damaged
		add $t7, $t0, 260
		lw $t2, ($t7)
		beq $t4, $t2, failed
		jr $ra
	gone:
		jr $ra
	failed:
		add $t2,$t0,0
		add $t3, $t0,16384
		
		screen2:
			lw $t4, black
			beq $t2, $t3,display
	
			sw $t4, ($t2)
			add $t2,$t2,4
			j screen2
		display:
			lw $t4, red
			jal you_text
			jal lost_text
			j failed_text	

	won:
		beq $t3, 2564, win_sc
		jr $ra
	win_sc:
		add $t2,$t0,0
		add $t3, $t0,16384
		clear_sc:
			lw $t4, black
			beq $t2, $t3,wtext
	
			sw $t4, ($t2)
			add $t2,$t2,4
			j clear_sc
		wtext:
			lw $t4, gold
			jal you_text
			jal won_text
			j failed_text	
	you_text:
		
		#letter Y
		
		sw $t4, 7280 ($t0)
		sw $t4, 7024 ($t0)
		sw $t4, 6768 ($t0)
		sw $t4, 6764 ($t0)
		sw $t4, 6760 ($t0)
		sw $t4, 6772 ($t0)
		sw $t4, 6776 ($t0)
		sw $t4, 6520 ($t0)
		sw $t4, 6264 ($t0)
		sw $t4, 6504 ($t0)
		sw $t4, 6504 ($t0)
		sw $t4, 6248 ($t0)

		#letter O
		sw $t4, 6272 ($t0)
		sw $t4, 6276 ($t0)
		sw $t4, 6280 ($t0)
		sw $t4, 6528 ($t0)
		sw $t4, 6784 ($t0)
		sw $t4, 7040 ($t0)
		sw $t4, 7296 ($t0)
		sw $t4, 7300 ($t0)
		sw $t4, 7304 ($t0)
		sw $t4, 7308 ($t0)
		sw $t4, 7052 ($t0)
		sw $t4, 6796 ($t0)
		sw $t4, 6540 ($t0)
		sw $t4, 6284 ($t0)
		#letter U
		
		sw $t4, 6292 ($t0)
		sw $t4, 6548 ($t0)
		sw $t4, 6804 ($t0)
		sw $t4, 7060 ($t0)
		sw $t4, 7316 ($t0)
		sw $t4, 7320 ($t0)
		sw $t4, 7324 ($t0)
		sw $t4, 7328 ($t0)
		sw $t4, 7332 ($t0)
		sw $t4, 7076 ($t0)
		sw $t4, 6820 ($t0)
		sw $t4, 6564 ($t0)
		sw $t4, 6308 ($t0)
		jr $ra
	lost_text:
		#letter L
		
		sw $t4, 9568 ($t0)
		sw $t4, 9572 ($t0)
		sw $t4, 9576 ($t0)
		sw $t4, 9580 ($t0)
		sw $t4, 9312 ($t0)
		sw $t4, 9056 ($t0)
		sw $t4, 8800($t0)
		sw $t4, 8544 ($t0)
		
		#letter O
		
		sw $t4, 9344 ($t0)
		sw $t4, 9088 ($t0)
		sw $t4, 8832 ($t0)
		sw $t4, 8576 ($t0)
		sw $t4, 8572 ($t0)
		sw $t4, 8568 ($t0)
		sw $t4, 8564 ($t0)
		sw $t4, 8820 ($t0)
		sw $t4, 9076 ($t0)
		sw $t4, 9332 ($t0)
		sw $t4, 9588 ($t0)
		sw $t4, 9592 ($t0)
		sw $t4, 9596 ($t0)
		sw $t4, 9600 ($t0)
		
		#letter S
		sw $t4, 9608 ($t0)
		sw $t4, 9612 ($t0)
		sw $t4, 9616 ($t0)
		sw $t4, 9620 ($t0)
		sw $t4, 9364 ($t0)
		sw $t4, 9108 ($t0)
		sw $t4, 9104 ($t0)
		sw $t4, 9100 ($t0)
		sw $t4, 9096 ($t0)
		sw $t4, 8840 ($t0)
		sw $t4, 8584 ($t0)
		sw $t4, 8588 ($t0)
		sw $t4, 8592 ($t0)
		sw $t4, 8596 ($t0)
		
		#letter T
		sw $t4, 9636 ($t0)
		sw $t4, 9380 ($t0)
		sw $t4, 9124 ($t0)
		sw $t4, 8868 ($t0)
		sw $t4, 8612 ($t0)
		sw $t4, 8608 ($t0)
		sw $t4, 8604 ($t0)
		sw $t4, 8620 ($t0)
		sw $t4, 8616 ($t0)
		jr $ra
	won_text:
		#Letter W
		sw $t4, 8552 ($t0)
		sw $t4, 8808 ($t0)
		sw $t4, 9064 ($t0)
		sw $t4, 9320 ($t0)
		sw $t4, 9576 ($t0)
		sw $t4, 9580 ($t0)
		sw $t4, 9584 ($t0)
		sw $t4, 9328 ($t0)
		sw $t4, 9072 ($t0)
		sw $t4, 8816 ($t0)
		sw $t4, 8560 ($t0)
		sw $t4, 9588 ($t0)
		sw $t4, 9592 ($t0)
		sw $t4, 9336 ($t0)
		sw $t4, 9080 ($t0)
		sw $t4, 8824 ($t0)
		sw $t4, 8568 ($t0)
		#letter O
		sw $t4, 9600 ($t0)
		sw $t4, 9344 ($t0)
		sw $t4, 9088 ($t0)
		sw $t4, 8832 ($t0)
		sw $t4, 8576 ($t0)
		sw $t4, 9604 ($t0)
		sw $t4, 9608 ($t0)
		sw $t4, 9612 ($t0)
		sw $t4, 9356 ($t0)
		sw $t4, 9100 ($t0)
		sw $t4, 8844 ($t0)
		sw $t4, 8588 ($t0)
		sw $t4, 8584 ($t0)
		sw $t4, 8580 ($t0)
		
		
		#letter n
		sw $t4, 9620 ($t0)
		sw $t4, 9364 ($t0)
		sw $t4, 9108 ($t0)
		sw $t4, 8852 ($t0)
		sw $t4, 8596 ($t0)
		sw $t4, 8600 ($t0)
		sw $t4, 8604 ($t0)
		sw $t4, 8608 ($t0)
		sw $t4, 8864 ($t0)
		sw $t4, 9120 ($t0)
		sw $t4, 9376 ($t0)
		sw $t4, 9632 ($t0)
		
		#exclamation
		sw $t4, 9644 ($t0)
		sw $t4, 9132 ($t0)
		sw $t4, 8876 ($t0)
		sw $t4, 8620 ($t0)
	
		
		jr $ra
	damaged:
		lw $t4, red
		add $t2,$t3,$t0
		
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		sub  $t2, $t2, 256  # Add 256 to the offset value
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		sub $t2, $t2, 256  # Add 256 to the offset value
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		sub $t2, $t2, 256  # Add 256 to the offset value
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		lw $t4, red
		sw $t4, 5540($t0)
		sw $t4, 5544($t0)
		sw $t4, 5548($t0)
		lw $t4, red
		sw $t4, ($t7)
		jr $ra
		
	armor: 
		lw $t4, gold
		add $t7, $t0, 308
		lw $t2, ($t7)
		beq $t4, $t2, gold_shield
		beq $t3, 6828,golden
		jr $ra
	gold_shield:
		lw $t4, gold
		add $t2,$t3,$t0
		
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		sub  $t2, $t2, 256  # Add 256 to the offset value
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		sub $t2, $t2, 256  # Add 256 to the offset value
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		sub $t2, $t2, 256  # Add 256 to the offset value
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		jr $ra
	golden:
		lw $t4, black
		add $t7, $t0, 308
		lw $t2, ($t7)
		beq $t4, $t2, gold_stat
		jr $ra
	gold_stat:
		lw $t4, gold
		sw $t4, 308 ($t0)
		jr $ra
	replenish:
		beq $t3, 8064,health1
		beq $t3, 8068, health2
		beq $t3, 8072, health3
		jr $ra
	health1:
		lw $t4, green
		sw $t4, 284($t0)
		jr $ra
	health2:
		lw $t4, green
		sw $t4, 292($t0)
		jr $ra
	health3:
		lw $t4, green
		sw $t4,300($t0)
	 	jr $ra
	respond_to_a:
		addi $t8, $zero, 0
		beq $t5,0, movement
		sub $t5, $t5, 1
		jal remove
		add $t2, $t3, $t0
		sub $t2, $t2, 768
		jal collision_sideways
		sub $t3,$t3, 4
		j update
	respond_to_d:
	
		addi $t8, $zero, 0
		
		beq $t5,63, movement
		add $t5, $t5, 1
		jal remove
		add $t2, $t3, $t0
		sub $t2, $t2, 768
		jal collision_sideways
		add $t3,$t3, 4
		j update
	respond_to_w:
		lw $t7, midj
		beq $t7,1, doubled
		add $t7, $zero, 1
		sw $t7, midj
		add $t2, $t3, 256
		lw $t4, dblue
		add $t2, $t2, $t0
		lw $t7, ($t2)
		beq $t6,0, gravity
		
		jump:
			bne $t7, $t4, movement
			addi $t8, $zero, 0
			sub $t6, $t6, 1
			jal remove
			add $t2, $t3, $t0
			sub $t2, $t2, 2560
			jal collision_up
			sub $t3, $t3, 2560
			j update
	doubled:
		
		
		lw $t4, gray
		add $t7, $t0, 316
		lw $t2, ($t7)
		beq $t4, $t2, doubled_jump
		j update
	doubled_jump:
		
			
			beq $t6,0, gravity
			addi $t8, $zero, 0
			sub $t6, $t6, 1
			jal remove
			add $t2, $t3, $t0
			sub $t2, $t2, 2560
			jal collision_up
			jal collision_sideways
			sub $t3, $t3, 2560
			lw $t4, black
			sw $t4, 316 ($t0)
			add $t7, $zero, 0
			sw $t7, midj
			j update
			
	collision_sideways:
		sub $t2, $t2, 4
		lw $t4, dblue
		lw $t7, ($t2)
		beq $t7, $t4, 	side_collide
		add $t2, $t2, 8
		lw $t4, dblue
		lw $t7, ($t2)
		beq $t7, $t4, 	side_collide		
		sub $t2, $t2, 8
		add $t2, $t2, 256
		lw $t4, dblue
		lw $t7, ($t2)
		beq $t7, $t4, 	side_collide
		add $t2, $t2, 8
		lw $t4, dblue
		lw $t7, ($t2)
		beq $t7, $t4, 	side_collide	
		sub $t2, $t2, 8
		add $t2, $t2, 256
		lw $t4, dblue
		lw $t7, ($t2)
		beq $t7, $t4, 	side_collide
		add $t2, $t2, 8
		lw $t4, dblue
		lw $t7, ($t2)
		beq $t7, $t4, 	side_collide	
		sub $t2, $t2, 8
		add $t2, $t2, 256
		lw $t4, dblue
		lw $t7, ($t2)
		beq $t7, $t4,	side_collide
		add $t2, $t2, 8
		lw $t4, dblue
		lw $t7, ($t2)
		beq $t7, $t4, 	side_collide	
		jr $ra	
	
	side_collide:
		
		j update 	
	collision_up: 
		lw $t4, dblue
		lw $t7, ($t2)
		beq $t7, $t4, col_up 
		add $t2,$t2,256
		lw $t4, dblue
		lw $t7, ($t2)
		beq $t7, $t4, col_up 
		add $t2,$t2,256
		lw $t4, dblue
		lw $t7, ($t2)
		beq $t7, $t4, col_up 
		add $t2,$t2,256
		lw $t4, dblue
		lw $t7, ($t2)
		beq $t7, $t4, col_up 
		add $t2,$t2,256
		lw $t4, dblue
		lw $t7, ($t2)
		beq $t7, $t4, col_up 
		add $t2,$t2,256
		lw $t4, dblue
		lw $t7, ($t2)
		beq $t7, $t4, col_up 
		add $t2,$t2,256
		lw $t4, dblue
		lw $t7, ($t2)
		beq $t7, $t4, col_up 
		add $t2,$t2,256
		lw $t4, dblue
		lw $t7, ($t2)
		beq $t7, $t4, col_up 
		add $t2,$t2,256
		lw $t4, dblue
		lw $t7, ($t2)
		beq $t7, $t4, col_up 
		add $t2,$t2,256
		lw $t4, dblue
		lw $t7, ($t2)
		beq $t7, $t4, col_up 
		
		jr $ra
	col_up:
		sub $t2, $t2, $t0
		add $t3, $t2, 256
		add $t3, $t3, 256
		add $t3, $t3, 256
		add $t3, $t3, 256
		
		
		j update
		
	remove:
		add $t2,$t3,$t0
		lw $t4, black
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		sub  $t2, $t2, 256  # Add 256 to the offset value
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		sub $t2, $t2, 256  # Add 256 to the offset value
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		sub $t2, $t2, 256  # Add 256 to the offset value
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		add $t2, $t3, 0
		jr $ra	
	
	gravity:
		add $t2, $t3, 256
		lw $t4, dblue
		add $t2, $t2, $t0
		lw $t7, ($t2)
		beq $t7, $t4, edge
		jal remove
		add $t3, $t3, 256
		
		j update
		j movement
		
	update:
		lw $t4, white
		add $t2,$t3,$t0
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		sub  $t2, $t2, 256  # Add 256 to the offset value
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		sub $t2, $t2, 256  # Add 256 to the offset value
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		sub $t2, $t2, 256  # Add 256 to the offset value
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		add $t2, $t3, 0	
		j movement
	mini:
		lw $t4, white
		add $t2,$t3,$t0
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		sub  $t2, $t2, 256  # Add 256 to the offset value
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		sub $t2, $t2, 256  # Add 256 to the offset value
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		sub $t2, $t2, 256  # Add 256 to the offset value
		sw $t4, ($t2)  # Store the value in $t4 to the memory location pointed to by $t0 + $t2
		add $t2, $t3, $t0
		jr $ra
	edge:
		add $t7, $zero, 0
		sw $t7, midj
		j movement
		
		
	
	moving_1:
	# platform 4
		
		lw $t4, black
		lw $t7, center
		sub $t7,$t7,32
		add $t7,$t7,$t0
		sw $t4, ($t7)
		sub $t7, $t7, $t0
		lw $t4, dblue
		add $t7, $t7, 36
		sub $t2, $t7, 0
		beq $t7, 10492, change
		add $t7, $t0, $t7
		sw $t4, ($t7)
		sub $t7,$t7,4
		sw $t4, ($t7)
		sub $t7,$t7,4
		sw $t4, ($t7)
		sub $t7,$t7,4
		sw $t4, ($t7)
		sub $t7,$t7,4
		sw $t4, ($t7)
		sub $t7,$t7,4
		sw $t4, ($t7)
		sub $t7,$t7,4
		sw $t4, ($t7)
		sub $t7,$t7,4
		sw $t4, ($t7)
		sub $t7,$t7,4
		sw $t4, ($t7)
		sw $t2, center
		jr $ra
	
	moving_2:

		
		lw $t4, black
		lw $t7, beginning
		sub $t7,$t7,32
		add $t7,$t7,$t0
		sw $t4, ($t7)
		sub $t7, $t7, $t0
		lw $t4, dblue
		add $t7, $t7, 36
		sub $t2, $t7, 0
		beq $t7, 4604, change_2
		add $t7, $t0, $t7
		sw $t4, ($t7)
		sub $t7,$t7,4
		sw $t4, ($t7)
		sub $t7,$t7,4
		sw $t4, ($t7)
		sub $t7,$t7,4
		sw $t4, ($t7)
		sub $t7,$t7,4
		sw $t4, ($t7)
		sub $t7,$t7,4
		sw $t4, ($t7)
		sub $t7,$t7,4
		sw $t4, ($t7)
		sub $t7,$t7,4
		sw $t4, ($t7)
		sub $t7,$t7,4
		sw $t4, ($t7)
		sw $t2, beginning
		jr $ra
	change_2:
		lw $t4, black
		sub $t7,$t7,32
		add $t7,$t7,$t0
		sw $t4, ($t7)
		add $t7, $t7,4
		sw $t4, ($t7)
		add $t7, $t7,4
		sw $t4, ($t7)
		add $t7, $t7,4
		sw $t4, ($t7)
		add $t7, $t7,4
		sw $t4, ($t7)
		add $t7, $t7,4
		sw $t4, ($t7)
		add $t7, $t7,4
		sw $t4, ($t7)
		add $t7, $t7,4
		sw $t4, ($t7)
		add $t7, $t7,4
		sw $t4, ($t7)
		add $t7, $t7,4
		sw $t4, ($t7)
		
		add $t7,$zero,4352
		sw $t7, beginning
		jr $ra	
	
	change:
		lw $t4, black
		sub $t7,$t7,40
		add $t7,$t7,$t0
		sw $t4, ($t7)
		add $t7, $t7,4
		sw $t4, ($t7)
		add $t7, $t7,4
		sw $t4, ($t7)
		add $t7, $t7,4
		sw $t4, ($t7)
		add $t7, $t7,4
		sw $t4, ($t7)
		add $t7, $t7,4
		sw $t4, ($t7)
		add $t7, $t7,4
		sw $t4, ($t7)
		add $t7, $t7,4
		sw $t4, ($t7)
		add $t7, $t7,4
		sw $t4, ($t7)
		add $t7, $t7,4
		sw $t4, ($t7)
		add $t7, $t7,4
		sw $t4, ($t7)
		add $t7, $t7,4
		sw $t4, ($t7)
		
		add $t7,$zero,10240
		sw $t7, center
		jr $ra	

	end_p:
	
		j Base
			
	failed_text:
		li $t9, 0xffff0000
		lw $t8, 0($t9)
		beq $t8, 1, p_clicked
		
		li $v0, 32
		li $a0, 40 # Wait one second (1000 milliseconds)
		syscall
		
		j failed_text
		
	p_clicked:
		lw $t7, 4($t9) # this assumes $t9 is set to 0xfff0000 from before
		beq $t7, 0x70, Base
		syscall
		j failed_text	
		
END:
	li $v0, 10 # terminate the program gracefully
	syscall
