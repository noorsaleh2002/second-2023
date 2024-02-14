     ORG $200
X    DS.B 4
Y    DS.L 1
     ORG $1000
MSG2 DC.B 'y = '
MSG1 DC.B 'Please enter X: '
Main MOVE.L #1,D0
     LEA MSG1,A1
     MOVE.W #16,D1
     TRAP #15 ;COUT
     MOVE.L #4,D0
     TRAP #15 ;CIN
     MOVE.L D1,X ;stor value into $200
     MULS.W #2,D1
     ADD.W #5,D1
     MOVE.L D1,Y ;SAVE VALUE into $204
     MOVE.L #1,D0
     LEA MSG2,A1
     MOVE.W #4,D1
     TRAP #15 ;COUT
     MOVE.L #3,D0
     MOVE.L Y,D1
     TRAP #15 ;COUT THE ANSWER
     END Main
     
     
     
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
