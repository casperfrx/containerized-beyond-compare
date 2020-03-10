# Beyond Compare in Docker

## Description
This is a Dockerfile for Beyond Compare, the comparison tool.

I made it mostly for personal use. It is based on the debian:buster-slim image
because that's what Beyond Compare offered as supported platform with a .deb package.

## Requirements:
- Docker obviously
- X server

## Build
Build with:
```bash
docker build -t your/beyondcompare:4.3.4.24657 -t your/beyondcompare:latest .
```

## Run
This image has a volume at /data, so run:
```bash
docker run \
    -it \
    --rm \
    -v $PWD:/data \
    -e DISPLAY=$DISPLAY \
    your/beyondcompare
```

