#!/bin/bash -x

echo "Welcome to Employee Wage Computation Program"

# Constants
IS_PART_TIME=1
IS_FULL_TIME=2
EMP_RATE_PER_HOUR=20
NUM_WORKING_DAYS=20
MAX_HRS_IN_MONTH=100

# Variables
totalEmpHrs=0
totalWorkingDays=0

# Function to get work hours
function getWorkHrs() {
   local empCheck=$1
   case $empCheck in
      $IS_FULL_TIME)
         empHrs=8
         ;;
      $IS_PART_TIME)
         empHrs=4
         ;;
      *)
         empHrs=0
         ;;
   esac
   echo $empHrs
}

# Function to calculate wages for a day
function calcDailyWage() {
   local workHrs=$1
   wage=$(($workHrs*$EMP_RATE_PER_HOUR))
   echo $wage
}

# UC-1: Check Employee Attendance
empCheck=$((RANDOM%2))
if [ $empCheck -eq 1 ]
then
   echo "Employee is Present"
else
   echo "Employee is Absent"
fi

# UC-2: Calculate Daily Employee Wage
empCheck=$((RANDOM%2))
empHrs="$(getWorkHrs $empCheck)"
wage="$(calcDailyWage $empHrs)"
echo "Wage for the day: $wage"

# UC-3: Add Part Time Employee and Wage
empCheck=$((RANDOM%3))
empHrs="$(getWorkHrs $empCheck)"
wage="$(calcDailyWage $empHrs)"
echo "Wage for the day: $wage"

# UC-4: Solve using Switch Case Statement
empCheck=$((RANDOM%3))
empHrs="$(getWorkHrs $empCheck)"
wage="$(calcDailyWage $empHrs)"
echo "Wage for the day: $wage"

# UC-5: Calculating Wages for a Month
while [[ $totalEmpHrs -lt $MAX_HRS_IN_MONTH && $totalWorkingDays -lt $NUM_WORKING_DAYS ]]
do
   ((totalWorkingDays++))
   empCheck=$((RANDOM%3))
   empHrs="$(getWorkHrs $empCheck)"
   totalEmpHrs=$(($totalEmpHrs+$empHrs))
   dailyWage[$totalWorkingDays]="$(calcDailyWage $empHrs)"
done

totalSalary=$(($totalEmpHrs*$EMP_RATE_PER_HOUR))
echo "Total Salary for a Month is: $totalSalary"

# UC-6: Store the Day and the Daily Wage along with the Total Wage
echo "Day-Wise Wage Details:"
for (( i=1; i<=$totalWorkingDays; i++ ))
do
   echo "Day $i: ${dailyWage[$i]}"
done

# UC-7: Store the Day and Daily Wage along with the Total Wage in dictionary
echo "Day-Wise Wage Details using Dictionary:"
declare -A dailyWageDict
for (( i=1; i<=$totalWorkingDays; i++ ))
do
   dailyWageDict["Day $i"]="${dailyWage[$i]}"
done
echo ${!dailyWageDict[@]}
echo ${dailyWageDict[@]}

# UC-8: Display Total Wage and Total Working Hours Using Dictionary
echo "Total Working Hours: $totalEmpHrs"
echo "Total Salary for a Month is: $totalSalary"
echo "Day-Wise Wage Details using Dictionary:"
echo ${!dailyWageDict[@]}
echo ${dailyWageDict[@]}
