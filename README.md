# Getting started

## Configuration
Configuration file MUST be config/config.tf. I you want to set up multiple sessions, copy/paste or symlink this file.

Set the list of attendees in config.tf, one line per attendee. Those are plain text values that give context to the spawned instances.
Additionaly, you can customize the instructor name, thus this has no real impact.

```
students = [
  "student 1",
  "student 2",
]

instructor = "instructor"
```

## Start instructor instance

```
# Strat instance
./trainctl start instructor
# Transfer files from instructor folder to vm
./trainctl sync

```

## Start introduction session

```
# Preview actions
./trainctl plan introduction
# Start instances
./trainctl start introduction
```

## Start advanced session

```
# Preview actions
./trainctl plan introduction
# Start instances
./trainctl start introduction
```
