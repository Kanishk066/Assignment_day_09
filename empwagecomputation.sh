#!/bin/bash

echo "Welcome to Employee Wage Computation Program"

# UC-1: Check Employee Attendance
isPresent=1
randomCheck=$((RANDOM%2))

if [ $randomCheck -eq $isPresent ]
then
    echo "Employee is Present"
else
    echo "Employee is Absent"
fi

# UC-2: Calculate Daily Employee Wage
isFullTime=1
empRatePerHour=20
randomCheck=$((RANDOM%2))

if [ $randomCheck -eq $isFullTime ]
then
    empHrs=8
else
    empHrs=0
fi

salary=$((empHrs * empRatePerHour))
echo "Salary is: $salary"

# UC-3: Add Part Time Employee and Wage
isFullTime=1
isPartTime=2
empRatePerHour=20
randomCheck=$((RANDOM%3))

if [ $randomCheck -eq $isFullTime ]
then
    empHrs=8
elif [ $randomCheck -eq $isPartTime ]
then
    empHrs=4
else
    empHrs=0
fi

salary=$((empHrs * empRatePerHour))
echo "Salary is: $salary"

# UC-4: Solve using Switch Case Statement
isFullTime=1
isPartTime=2
empRatePerHour=20
randomCheck=$((RANDOM%3))

case $randomCheck in
    $isFullTime)
        empHrs=8
        ;;
    $isPartTime)
        empHrs=4
        ;;
    *)
        empHrs=0
        ;;
esac

salary=$((empHrs * empRatePerHour))
echo "Salary is: $salary"

# UC-5: Calculating Wages for a Month
isFullTime=1
isPartTime=2
empRatePerHour=20
numWorkingDays=20
totalSalary=0

for (( day=1; day<=$numWorkingDays; day++ ))
do
    randomCheck=$((RANDOM%3))

    case $randomCheck in
        $isFullTime)
            empHrs=8
            ;;
        $isPartTime)
            empHrs=4
            ;;
        *)
            empHrs=0
            ;;
    esac

    salary=$((empHrs * empRatePerHour))
    totalSalary=$((totalSalary + salary))
done

echo "Total Salary for a Month is: $totalSalary"
