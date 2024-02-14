    ORG $200
C1  DC.B 'Enter elapsed time in seconds: ' ;31
SEM DC.B ':'
TIME DS.W 1
H    DS.B 1
M    DS.B 1
S    DS.B 1
    ORG $1000
ST  MOVE.L #1,D0
    LEA C1,A1
    MOVE.W #31,D1
    TRAP #15
    MOVE.L #4,D0
    TRAP #15
    MOVE.W D1,TIME
    DIVU #3600,D1
    MOVE.B D1,H
    MOVE.B D1,D2 ;make copy of how many hours
    MULU #3600,D2 ; know how many sec there are in H
    MOVE.W TIME,D1 ;return the org. value of sec
    SUB.W D2,D1 ;remove the sec of hours and remain the rest for mins.sec in D1
    MOVE.W D1,D3 ;Stor sec and min
    AND.L #$0000FFFF,D1
    DIVU #60,D1
    MOVE.B D1,M
    MOVE.W D1,D2
    MULU #60,D2
    MOVE.W D3,D1
    SUB.W D2,D1 ;REMAIM HOW MANY SEC LEFT
    MOVE.B D1,S 
    CLR.L D1
    MOVE.L #3,D0 ;STARING COUT THE ANSWER
    MOVE.B H,D1
    TRAP #15
    MOVE.L #1,D0
    LEA SEM,A1
    MOVE.W #1,D1
    TRAP #15
    MOVE.L #3,D0
    MOVE.B M,D1
    TRAP #15
    MOVE.L #1,D0
    LEA SEM,A1
    MOVE.W #1,D1
    TRAP #15
    MOVE.L #3,D0
    MOVE.B S,D1
    TRAP #15
    END ST
    
    
    
    
    
    
    






*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
