#!/bin/bash

# This script is used to run the built project.
# Consider porting it to a more robust solution like Docker.

# Trap SIGINT to later kill the server and frontend.
trap ctrl_c SIGINT
function ctrl_c() {
    echo "Ctrl-C caught. Killing server and frontend."
    kill -INT $PID1 $PID2
}

# Start the server.
cd backend
poetry run uvicorn main:app --port 3001 & # As you can see, we're not using the --reload flag.
PID1=$!
cd ..

# Start the frontend.
# cd frontend
uvicorn serveFrontend:app --port 3000 &
PID2=$!

wait
echo "done"