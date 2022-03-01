	.data 0x100001d8 # 0x100000d8
st1:	.asciiz "a("
st123:	.asciiz ")="
st2:	.asciiz "c("
st3:	.asciiz "c("

	.text
main:

	lui $a1, 0x1000
#	addi $a1, $a1, 0
	lui $a2, 0x1000
	addi $a2, $a2, 0x48
	lui $a3, 0x1000
	addi $a3, $a3, 0x90
	
	or $t0, $0, $a1		# dieythynsh apothhkeyshs
	addi $s3, $0, 2		#bohthhtiko
	add $s0, $0, $0 	# s0=0;
startif1:
	bge $s0, $s3, endif1
	add $s1, $0, $0		#s1=0;
startif2:
	bge $s1, $s3, endif2
	addi $v0, $0, 4
	la $a0, st1
	syscall			#cout << "a(";
	or $a0, $s0, $0
	addi $v0,$0, 1
	syscall			#cout << s0;
	addi $v0, $0, 11
	addi $a0, $0, 0x2c
	syscall			#cout << ',';
	addi $v0, $0, 1
	or $a0, $s1, $0
	syscall			#cout << s1;
	addi $v0, $0, 4
	la $a0, st123
	syscall			#cout << ")=";
	addi $v0, $0,7
	syscall			#... cin >> a1[s0][s1];
	sdc1 $f0, ($t0)
	addi $t0, $t0, 8
	addi $s1, $s1, 1	#s1++;
	j startif2
endif2:
	addi $s0, $s0, 1
	j startif1
endif1:
# - - - - - - - -
	or $t0, $0, $a2		# dieythynsh apothhkeyshs
	add $s0, $0, $0 	# s0=0;
startif3:
	bge $s0, $s3, endif3
	add $s1, $0, $0		#s1=0;
startif4:
	bge $s1, $s3, endif4
	addi $v0, $0, 4
	la $a0, st2
	syscall			#cout << "b(";
	or $a0, $s1, $0
	addi $v0,$0, 1
	syscall			#cout << s0;
	addi $v0, $0, 11
	addi $a0, $0, 0x2c
	syscall			#cout << ',';
	addi $v0, $0, 1
	or $a0, $s0, $0
	syscall			#cout << s1;
	addi $v0, $0, 4
	la $a0, st123
	syscall			#cout << ")=";
	addi $v0, $0,7
	syscall			#cin >> a1[s0][s1];
	sdc1 $f0, ($t0)
	addi $t0, $t0, 8
	addi $s1, $s1,1		#s1++;
	j startif4
endif4:
	addi $s0, $s0, 1
	j startif3
endif3:
  
#------------------------------pra3h-------------------------------------
        
        or $t1, $0, $a1
	or $t2, $0, $a2
	or $t0, $0, $a3
	and $s0, $0, $0		          #s0=0;
startif5:
	bge $s0, $s3, endif5              #  branch to target if  $s0 >= $s3
	and $s1, $0, $0		          #s1=0;
startif6:
	bge $s1, $s3, endif6
	sub.d $f6, $f6, $f6	          #f6=0;
	and $s2, $0, $0		          #s2=0;
startif7:
        bge $s2, $s3, endif7
        ldc1 $f2,($t1)
        ldc1 $f4,($t2)
        mul.d $f0,$f2,$f4                 #f0=f2*f4
        add.d $f6,$f6,$f0                 #f6+=f0
        addi $s2,$s2,1                    #s2++;
        addi $t1,$t1,8                    #t0+=8;
        addi $t2,$t2,8
        j startif7
endif7:
        sdc1 $f6,($t0)                    #apothhkeysh f6
        addi $t0,$t0,8
        addi $s1,$s1,1
        addi $t1,,$t1,-16
        j startif6
endif6:
        addi $s0,$s0,1                     #s0++;
        addi $t2,$t2, -32
        addi $t1,$t1,16
        j startif5
endif5:

#---------------------------ektypwsh------------------------------


         or $t0,$a3,$0
         add $s0,$0,$0                     #s0++;
startif8:
         bge $s0, $s3, endif8
	 add $s1, $0, $0		   #s1=0;
startif9:
         bge $s1,$s3,endif9
         addi $v0,$0,4
         la $a0,st3
         syscall                          #cout << "c(";
         or $a0,$s0,$0
         addi $v0,$0,1
         syscall                          #cout << s0;
         addi $v0,$0,11
         addi $a0,$0,0x2c
         syscall                          #cout << ',';
         or $a0,$s1,$0
         addi $v0,$0,1
         syscall                          #cout << s1;
         addi $v0,$0,4
         la $a0,st123
         syscall                          #cout << ")=";
         addi $v0,$0,3
         ldc1 $f12 ,($t0)
         syscall                          #cout << a3[s0][s1];
         addi $t0,$t0,8
         addi $s1,$s1,1
         j startif9
endif9:
         addi $s0,$s0,1
         j startif8
endif8:
 
          addi $v0,$0,10
          syscall

