#!/bin/bash -x

echo "Welcome to Employee Wage Computation"

# CONSTANTS
IS_PART_TIME=1
IS_FULL_TIME=2
salary=0
MAX_HRS_IN_MONTH=10
EMP_RATE_PER_HR=20
NUM_WORKING_DAYS=20

# VARIABLES
totalEmpWorkingHrs=0
totalWorkingDays=0


function getWorkingHours() {
	case $1 in
		$IS_FULL_TIME)
			empHours=8
			;;
		$IS_PART_TIME)
			empHours=4
			;;
		*)
			empHours=0
			;;
	esac
	echo $empHours
}

while [[ $totalEmpWorkingHrs -lt $MAX_HRS_IN_MONTH && $totalWorkingDays -lt $NUM_WORKING_DAYS ]]
do
	(( totalWorkingDays++ ))
	empHours="$( getWorkingHours $(( RANDOM % 3 )))"
	totalEmpWorkingHours=$(( $totalEmpWorkingHrs + $empHours ))
done

   totalSalary=$(( $totalEmpWorkingHours * $EMP_RATE_PER_HR ))
   echo "Employee Wage per month:" $totalSalary
