      IDENTIFICATION DIVISION.
      PROGRAM-ID. Greet.
   
      DATA DIVISION.
      WORKING-STORAGE SECTION.
      01 EmpName PIC X(30).
      01 EmpAge PIC 9(2) VALUE 0.
   
      PROCEDURE DIVISION.
      DISPLAY "Welcome to COBOL!".
      PERFORM GET_EMP_INFO.
      STOP RUN.
      


      GET_NAME.
       DISPLAY "Please enter your name: "
       ACCEPT EmpName.
       DISPLAY "Nice to meet you " EmpName.

       GET_AGE.
        DISPLAY "Enter your age: "
        ACCEPT EmpAge.
        DISPLAY "You are " EmpAge " years old".

      GET_EMP_INFO.
       PERFORM GET_NAME
       PERFORM GET_AGE.



       
