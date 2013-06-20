#!/bin/bash
if [ -f ~/.serverdb ]; then
  rm ~/.serverdb
fi
sqlite3 ~/.serverdb "create table servers(category varchar(30) not null check(category != ''), environment varchar(30) not null check(category != ''), hostname varchar(100) not null check(category != ''), unique(category, environment, hostname))"
