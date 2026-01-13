       IDENTIFICATION DIVISION.
       PROGRAM-ID. Payroll.

       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01 EMPLOYEE-DETAILS.
           05 EMP-NAME PIC X(30).
           05 BASIC-SALARY PIC 9(6)V99.
           05 ALLOWANCES PIC 9(6)V99.
           05 DEDUCTIONS PIC 9(6)V99.
           05 NET-SALARY PIC 9(6)V99.

       PROCEDURE DIVISION.
           DISPLAY "Enter employee name: ".
           ACCEPT EMP-NAME.

           DISPLAY "Enter basic salary (no decimal): ".
           ACCEPT BASIC-SALARY.

           DISPLAY "Enter allowances (no decimal): ".
           ACCEPT ALLOWANCES.

           DISPLAY "Enter deductions (no decimal): ".
           ACCEPT DEDUCTIONS.

           COMPUTE NET-SALARY =
               BASIC-SALARY + ALLOWANCES - DEDUCTIONS.

           DISPLAY "PAYROLL SUMMARY: ".
           DISPLAY "Employee name: " EMP-NAME.
           DISPLAY "Basic salary: " BASIC-SALARY.
           DISPLAY "Allowances: " ALLOWANCES.
           DISPLAY "Deductions: " DEDUCTIONS.
           DISPLAY "Net Salary: " NET-SALARY.

           STOP RUN.
