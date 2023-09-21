#!/bin/bash

# Remove last result
rm -r dist

# Create output directory.
mkdir dist

# Copy the backend directly
cp -r backend dist/backend

# Build the frontend
cd frontend
npm run build
cd ..

# Copy the frontend build to the bulit directory
cp -r frontend/dist dist/frontend

# Copy run scripts
cp deploy/serveFrontend.py dist/serveFrontend.py
cp deploy/serveAll.sh dist/serve.sh