       IDENTIFICATION DIVISION.
       PROGRAM-ID. Counts.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CountUp PIC 9(2) VALUE 0.
       01 CountDown PIC 9(2) VALUE 50.

       PROCEDURE DIVISION.
        PERFORM COUNT_UP.
        PERFORM COUNT_DOWN.
        STOP RUN.



       COUNT_UP.
           PERFORM UNTIL CountUp >= 20
           ADD 1 TO CountUp
           DISPLAY "Current Count: " CountUp
           END-PERFORM.

       COUNT_DOWN.
           PERFORM UNTIL CountDown = 0
           SUBTRACT 1 FROM CountDown
           DISPLAY  "Current Count: " CountDown
           END-PERFORM.

