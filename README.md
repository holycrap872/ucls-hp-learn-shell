# HP Themed Terminal Tutorial

This is an exercise designed to introduce Middle School and High School students
to shell. Coming into the exercise, students should have had a 10-15 minute
discussion about shell and common commands such as `ls`, `cd`, and `cat`.
This is no need to go into the difference between absolute and relative paths
since that is presented in the actual activity.

Once the students have a general idea of the commands, set the scene:
- You wake up in a dark room
- You use `ls` (lumos) to show you what's around you
- You have the ability to `cd` (change doors) on directories
- You have the ability to `cat` files
- You have the ability to run `green` programs
- There are clues hidden both in the shell and in the real world

Go!

## Instructions to Try Pre-Built Docker Image

> Note: There are location specific details in the pre-built image. You will
  have to build your own version with the proper parameters if you want to
  actually run this demo with students.

1. Pull down docker image from [here](https://hub.docker.com/r/erizzi/hp_terminal_tutorial)
2. Run the docker image
    - `docker run -e IDENTIFIER=4 -it erizzi/hp_terminal_tutorial /bin/zsh`
    - Alter the `IDENTIFIER` env var to choose which of the 12 clue sets use
3. Use the [clues](./clues) folder to see what the students would see

## Instructions to Build

1. Alter the [metadata.json](./clues/metadata.json) file to create location specific clues
2. `docker build -f Dockerfile -t harry_potter .`
3. `docker run -e IDENTIFIER=4 -it harry_potter`

## Instructions to Push

1. `docker build -f Dockerfile -t harry_potter .`
2. `docker login`
3. `docker tag harry_potter erizzi/hp_terminal_tutorial`
4. `docker push erizzi/hp_terminal_tutorial`
