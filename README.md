# Beyond Compare in Docker

## Description
This is the Dockerfile for Beyond Compare, the GUI diff tool.

I made it mostly for personal use. It is based on the debian:bullseye-slim image due to Debian being 
[officially listed as supported Linux OS](https://www.scootersoftware.com/download.php) on 
[Scooter Software](https://www.scootersoftware.com/)'s download page.

## Requirements:
- Docker
- X server

*Note: this docker container can also run on [Windows Subsystem for Linux (WSL2)](https://docs.microsoft.com/en-us/windows/wsl/install).
You will require to run a Windows Xserver like [MobaXterm](https://mobaxterm.mobatek.net/) or
[VcXserv Windows X Server](https://sourceforge.net/projects/vcxsrv/). You will need to set the ```DISPLAY``` environment 
variable to your PC local Docker IP address Xserver to pick it up. This also works over SSH X11 forwarding.*

## Build
Build the container

```bash
docker build -t your/beyondcompare:latest .
```

## Run
This image has a volume at /data which it uses to access files for comparison on the local filesystem:
```bash
docker run \
    -it \
    --rm \
    -v $PWD:/data \
    -e DISPLAY=$DISPLAY \
    your/beyondcompare
```
