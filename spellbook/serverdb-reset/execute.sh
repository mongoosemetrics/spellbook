#!/bin/bash
if [ -f ~/.serverdb ]; then
  rm ~/.serverdb
fi
sqlite3 ~/.serverdb "create table servers(category varchar(30), environment varchar(30), hostname varchar(30))"
