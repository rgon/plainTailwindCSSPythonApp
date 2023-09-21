#!/bin/bash

# This script is used to develop the project.

# Trap SIGINT to later kill the server and frontend.
trap ctrl_c SIGINT
function ctrl_c() {
    echo "Ctrl-C caught. Killing server and frontend."
    kill -INT $PID1 $PID2
}

# Start the server.
cd backend
poetry run uvicorn main:app --port 3001 --reload &
PID1=$!
cd ..

# Start the frontend.
cd frontend
npm run dev -- --port 3000 &
PID2=$!

wait
echo "done"