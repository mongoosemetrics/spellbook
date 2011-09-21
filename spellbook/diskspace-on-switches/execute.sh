#!/bin/bash

# Define the list of switch hostnames
servers=switch8.mongoosemetrics.com \
    switch9.mongoosemetrics.com \
    switch10.mongoosemetrics.com \
    switch11.mongoosemetrics.com \
    switch12.mongoosemetrics.com \
    switch13.mongoosemetrics.com \
    switch14.mongoosemetrics.com \
    switch15.mongoosemetrics.com \
    switch16.mongoosemetrics.com

# Loop over all of the files in the current directory
for hostname in $servers; do
    # Display the result of 'df -h' on the current host
    ssh root@$hostname 'df -h'
done
