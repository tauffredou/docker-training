# Configuration
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

# Start instructor instance

Start instance
```
./trainctl start instructor
```

Transfer files from instructor folder to vm
```
./trainctl sync

```

# Start introduction session

Preview actions
```
./trainctl plan introduction
```
Start instances
```
./trainctl start introduction
```

# Start advanced session

Preview actions
```
./trainctl plan advanced
```

Start instances
```
./trainctl start advanced
```

# Show instances details

```
./trainctl info

Instructor

Introduction
Docker introduction - student 1	54.195.53.209
Docker introduction - student 2	54.170.118.30

Advanced
```

You can copy paste result into the chat room

# Clean up

```
./trainctl stop instructor
./trainctl stop introduction
./trainctl stop advanced
```
