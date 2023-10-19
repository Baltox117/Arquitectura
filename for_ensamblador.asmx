.text
	        addi    t0,x0,15
	        addi    t1,x0,57
	        addi    t2,x0,70
	        addi    t3,x0,17
	        addi    t4,x0,0
	        addi    t5,x0,120
	        sw      t0,0(x0)
	        sw      t1,4(x0)
	        sw      t2,8(x0)
	        sw      t3,12(x0)
	        sw      t4,16(x0)
	        sw      t5,20(x0)

                addi    s0,x0,0     # i = 0
                addi    s2,x0,6     # N = 6
for_i:          addi    s1,x0,0     # j = 0
for_j:	        slli    t0,s0,2     # offset de i
                lw      t1,0(t0)    # A[i]
	            slli    t2,s1,2     # offset de j
                lw      t3,0(t2)    # A[j]
                slt     t4,t1,t3    
                bne     t4,x0,intercambia
                jal     x0,incremento_j
intercambia:    sw      t3,0(t0)
                sw      t1,0(t2)
incremento_j:   addi    s1,s1,1
                slt     t5,s1,s2
                bne     t5,x0,for_j
                addi    s0,s0,1
                slt     t6,s0,s2
                bne     t6,x0,for_i
end:
