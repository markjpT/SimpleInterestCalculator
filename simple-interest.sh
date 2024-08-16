#!/bin/bash

# Simple Interest Calculator

# Function to calculate simple interest
calculate_simple_interest() {
    local principal=$1
    local rate=$2
    local time=$3
    echo "scale=2; ($principal * $rate * $time) / 100" | bc
}

# Prompt user for input
echo "Welcome to the Simple Interest Calculator"
read -p "Enter the principal amount: " principal
read -p "Enter the rate of interest (in %): " rate
read -p "Enter the time period (in years): " time

# Validate input
if [[ ! $principal =~ ^[0-9]+(\.[0-9]+)?$ ]] || [[ ! $rate =~ ^[0-9]+(\.[0-9]+)?$ ]] || [[ ! $time =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Invalid input. Please enter numerical values."
    exit 1
fi

# Calculate simple interest
interest=$(calculate_simple_interest "$principal" "$rate" "$time")

# Display the result
echo "Simple Interest: $interest"
