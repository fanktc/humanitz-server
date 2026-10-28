#!/bin/bash

echo "================================="
echo "Container Status"
echo "================================="

docker ps

echo ""

echo "================================="
echo "Docker Resource Usage"
echo "================================="

docker stats --no-stream
