#!/bin/bash

# This script is used to develop the project.

# Trap SIGINT to later kill the server and frontend.
trap ctrl_c SIGINT
function ctrl_c() {
    echo "Ctrl-C caught. Killing server and frontend."
    kill -INT $PID1 $PID2
}

# Start the server.
python backend/__init__.py &
PID1=$!

# Start the frontend.
cd frontend
npm run dev -- --port 3000 &
PID2=$!

wait
echo "done"