       IDENTIFICATION DIVISION.
       PROGRAM-ID. Budget-Planner.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01 AS-ANNUAL-SALARY PIC 9(6) VALUE 0.
       01 AS-MONTHLY-SALARY PIC 9(6) VALUE 0.
       01 AS-RENT PIC 9(6) VALUE 0.
       01 AS-UTILITIES PIC 9(6) VALUE 0.
       01 AS-TRANSPORTATION PIC 9(4) VALUE 0.
       01 AS-GROCERIES PIC 9(6) VALUE 0.
       01 AS-ENTERTAINMENT PIC 9(6) VALUE 0.

       01 AS-TOTAL-MANDATORY-EXPENSES PIC 9(6) VALUE 0.
       01 AS-TOTAL-DISCRETIONARY-EXPENSES PIC 9(6) VALUE 0.
       01 AS-TOTAL-EXPENSES PIC 9(6) VALUE 0.
       01 AS-SAVINGS PIC 9(5) VALUE 0.

       PROCEDURE DIVISION.
           PERFORM 0100-GET-USER-INFO.
           PERFORM 0500-SPACES.
           PERFORM 0200-CALCULATE-TOTAL-EXPENSES.
           PERFORM 0500-SPACES.
           PERFORM 0300-SAVINGS-FROM-MONTHLY-SALARY.
           PERFORM 0500-SPACES.
           PERFORM 0400-BUDGET.
           PERFORM 0500-SPACES.
           

       STOP RUN.

       0100-GET-USER-INFO.
           DISPLAY "Please enter annual salary: ".
           ACCEPT AS-ANNUAL-SALARY.

           DISPLAY "Please enter monthly rent amount: ".
           ACCEPT AS-RENT.
           ADD AS-RENT TO AS-TOTAL-MANDATORY-EXPENSES.

           DISPLAY "Please enter monthly utility amount: ".
           ACCEPT AS-UTILITIES.
           ADD AS-UTILITIES TO AS-TOTAL-MANDATORY-EXPENSES.

           DISPLAY "Please enter monthly transportation amount: ".
           ACCEPT AS-TRANSPORTATION.
           ADD AS-TRANSPORTATION TO AS-TOTAL-MANDATORY-EXPENSES.

           DISPLAY "Please enter monthly grocery amount: ".
           ACCEPT AS-GROCERIES.
           ADD AS-GROCERIES TO AS-TOTAL-MANDATORY-EXPENSES.

           DISPLAY "please enter monthly entertainment amount: ".
           ACCEPT AS-ENTERTAINMENT.
           ADD AS-ENTERTAINMENT TO AS-TOTAL-DISCRETIONARY-EXPENSES.

           DISPLAY "Mandatory Expenses: " AS-TOTAL-MANDATORY-EXPENSES.

       0200-CALCULATE-TOTAL-EXPENSES.
           ADD AS-TOTAL-MANDATORY-EXPENSES TO AS-TOTAL-EXPENSES.
           ADD AS-TOTAL-DISCRETIONARY-EXPENSES TO AS-TOTAL-EXPENSES.
           DISPLAY "Your total monthly expenses = $" AS-TOTAL-EXPENSES.
       
       0300-SAVINGS-FROM-MONTHLY-SALARY.
           COMPUTE AS-MONTHLY-SALARY = AS-ANNUAL-SALARY / 12.
           DISPLAY "Monthly Salary: " AS-MONTHLY-SALARY.
       
           SUBTRACT AS-TOTAL-EXPENSES
               FROM AS-MONTHLY-SALARY
               GIVING AS-SAVINGS.
       
           IF AS-MONTHLY-SALARY < AS-TOTAL-EXPENSES
               DISPLAY "You have no money to save :("
           ELSE
               DISPLAY "Current Savings: $" AS-SAVINGS
           END-IF.


       0400-BUDGET.
           EVALUATE TRUE
               WHEN AS-TOTAL-EXPENSES > AS-MONTHLY-SALARY
                   DISPLAY "You are overspending! You will go broke."
               WHEN AS-SAVINGS < 0.1 * AS-MONTHLY-SALARY
                   DISPLAY "You are not saving enough!"
                   DISPLAY "Consider reducing discretionary expenses."
                   PERFORM 0500-SPACES
               WHEN OTHER 
                   DISPLAY "You are budgeting well! Keep it up :)"
                   PERFORM 0500-SPACES
           END-EVALUATE.

       0500-SPACES.
           DISPLAY "                                                  ".
           DISPLAY "--------------------------------------------------".
           DISPLAY "                                                  ".
