       IDENTIFICATION DIVISION.
       PROGRAM-ID. FILE-HANDLER.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPLOYEE-FILE ASSIGN TO "employee.dat"
           ORGANIZATION IS LINE SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL
           FILE STATUS IS FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.

       FD EMPLOYEE-FILE.
       01 EMPLOYEE-RECORD.
           05 EMP-NAME PIC A(30).
           05 EMP-SALARY PIC 9(6)V99.

       WORKING-STORAGE SECTION.

       01 FILE-STATUS PIC XX.
       01 WS-NAME PIC A(30).
       01 WS-SALARY PIC 9(6)V99.

       PROCEDURE DIVISION.
       OPEN EXTEND EMPLOYEE-FILE
           IF FILE-STATUS = "00"
               DISPLAY "File opened"
           ELSE
               DISPLAY "Failed to open the file"
               STOP RUN
           END-IF.

           DISPLAY "Enter employee name:"
           ACCEPT WS-NAME
           DISPLAY "enter employee salary:"
           ACCEPT WS-SALARY

           MOVE WS-NAME TO EMP-NAME
           MOVE WS-SALARY TO EMP-SALARY
           WRITE EMPLOYEE-RECORD

           IF FILE-STATUS NOT = "00" AND FILE-STATUS NOT = "10"
             DISPLAY "Error writing to file, file status: ", FILE-STATUS
             CLOSE EMPLOYEE-FILE
             STOP RUN
           END-IF.
           CLOSE EMPLOYEE-FILE
           DISPLAY "New employee has been added to file."

           DISPLAY "---- All File Contents ----"
           OPEN INPUT EMPLOYEE-FILE
           IF FILE-STATUS = "00"
               PERFORM READ-AND-DISPLAY UNTIL FILE-STATUS NOT = "00"
               CLOSE EMPLOYEE-FILE
           ELSE
               DISPLAY "Error reading from file"
           END-IF
           STOP RUN.

           READ-AND-DISPLAY.
               READ EMPLOYEE-FILE INTO EMPLOYEE-RECORD
                   AT END
                       MOVE "10" TO FILE-STATUS
                   NOT AT END
                       DISPLAY "Employee Name: " EMP-NAME
                       DISPLAY "Employee Salary: " EMP-SALARY
               END-READ. 
               



