#!/bin/bash

echo "Welcome to Employee Wage Computation Program on Master Branch"

# function to get work hours based on attendance
function get_work_hours() {
  case $1 in
    1)
      # employee is present
      echo "Enter the number of hours worked: "
      read hours
      case $hours in
        1|2|3|4)
          echo "$hours"
          ;;
        5|6|7|8)
          echo "8"
          ;;
        *)
          overtime=$(( $hours - 8 ))
          echo "$(( 8 + $overtime * 1.5 ))"
          ;;
      esac
      ;;
    0)
      # employee is absent
      echo "0"
      ;;
  esac
}

# check if employee is present or absent
attendance=$((Get-Random -Minimum 0 -Maximum 2))
case $attendance in
  1)
    echo "Employee is present"
    ;;
  0)
    echo "Employee is absent"
    ;;
esac

# initialize variables
hours_worked=0
days_worked=0
total_wage=0
daily_wage_array=()

# associative array to store day and daily wage
declare -A daily_wage_map

# calculate the wage until either 100 hours or 20 days have been worked
while [ $hours_worked -lt 100 ] && [ $days_worked -lt 20 ]
do
  # get the number of hours worked based on attendance
  hours=$(get_work_hours $attendance)
  
  # increment the number of hours and days worked
  ((hours_worked+=hours))
  ((days_worked++))
  
  # calculate the daily wage assuming wage per hour is 20 and full day hour is 8
  case $hours in
    1|2|3|4|5|6|7)
      daily_wage=$(( $hours * 20 ))
      ;;
    8)
      daily_wage=160
      ;;
    *)
      overtime=$(( $hours - 8 ))
      daily_wage=$(( 8 * 20 + $overtime * 20 * 1.5 ))
      ;;
  esac
  
  # add the daily wage to the total wage
  ((total_wage+=daily_wage))
  
  # add the day and daily wage to the daily_wage_map
  daily_wage_map[$days_worked]=$daily_wage
  
done

# calculate the monthly wage assuming 20 working days per month
monthly_wage=$(( $total_wage * 20 ))

# print the employee's total hours worked, total days worked, total wage, and monthly wage
echo "Employee's total hours worked: $hours_worked"
echo "Employee's total days worked: $days_worked"
echo "Employee's total wage: $total_wage"
echo "Employee's monthly wage: $monthly_wage"

# print the daily wage map
echo "Daily Wage Map:"
for day in "${!daily_wage_map[@]}"
do
  echo "Day $day: ${daily_wage_map[$day]}"
done
