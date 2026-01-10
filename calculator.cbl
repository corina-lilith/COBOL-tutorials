       IDENTIFICATION DIVISION.
       PROGRAM-ID. Calc.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM1 PIC 9(9) VALUE 0.
       01 NUM2 PIC 9(9) VALUE 0.
       01 OPERATION PIC X.
       01 RESULT PIC 9(9) VALUE 0.
       01 REMAINDER-VALUE PIC 9(9) VALUE 0.
       01 QUIT PIC X VALUE SPACE.


       PROCEDURE DIVISION.
           DISPLAY "Welcome to the calculator, enter 'q' to quit".
           PERFORM UNTIL QUIT = "Q" OR QUIT = "q"

               DISPLAY "Enter first number: "
               ACCEPT NUM1
    
               DISPLAY "Enter second number: "
               ACCEPT NUM2
               
               DISPLAY "Choose an operation : '+', '-', '*', '/', '%' "
               ACCEPT OPERATION
               
                EVALUATE OPERATION
                   WHEN "+"
                       PERFORM ADD-NUMS
                   WHEN "-"
                       PERFORM SUBTRACT-NUMS
                   WHEN "*"
                       PERFORM MULT-NUMS
                   WHEN "/"
                       PERFORM DIVIDE-NUMS
                   WHEN "%"
                       PERFORM MOD-NUMS
                   WHEN OTHER
                       DISPLAY "Invalid operation"
               END-EVALUATE

               DISPLAY "Q to quit or any key to continue"
               ACCEPT QUIT
           END-PERFORM
           STOP RUN.

           ADD-NUMS.
               ADD NUM1 TO NUM2 GIVING RESULT
               DISPLAY NUM1 " + " NUM2 " = " RESULT
               .

           SUBTRACT-NUMS.
               SUBTRACT NUM1 FROM NUM2 GIVING RESULT
               DISPLAY NUM1 " - " NUM2 " = " RESULT
               .
           
           MULT-NUMS.
               MULTIPLY NUM1 BY NUM2 GIVING RESULT
               DISPLAY NUM1 " * " NUM2 " = " RESULT
               .

           DIVIDE-NUMS.
                IF NUM2 = 0
               DISPLAY "No division by 0!"
           ELSE
               DIVIDE NUM1 BY NUM2 GIVING RESULT
               DISPLAY NUM1 " / " NUM2 " = " RESULT
           END-IF
           .
           
           MOD-NUMS.
           IF NUM2 = 0
               DISPLAY "No division by zero!"
           ELSE
               DIVIDE NUM1 BY NUM2
                   GIVING RESULT
                   REMAINDER REMAINDER-VALUE
               DISPLAY NUM1 " % " NUM2 " = " REMAINDER-VALUE
           END-IF
           .




