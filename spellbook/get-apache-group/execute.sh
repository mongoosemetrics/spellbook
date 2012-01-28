#!/bin/bash

# Determine the group name that apache is running as
group_name=$(ps axho user,comm|grep -E "httpd|apache"|uniq|grep -v "root"|awk 'END {print $1}')

# Echo the group name
echo $group_name
