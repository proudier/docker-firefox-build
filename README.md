# Docker - Build Firefox

This Dockerfile lets you build Firefox from source without messing around installing all of the dependencies on your host.


First, build the image from the Dockerfile
```
docker build -t [image-name:tag] /path/to/Dockerfile
```

When running the image, mount the directory on your host containing the Firefox source to `/usr/local/src/firefox` in the image. This way you can edit the source using your favourite editor and then give the container access to then compile it.
```
docker run -v /path/to/firefox/src:/usr/local/src/firefox -it [image-name:tag]
```

After the build has finished, you can share your X11 socket with the container to start Firefox.
```
docker run -v /path/to/firefox/src:/usr/local/src/firefox -v /tmp/.X11-unix:/tmp/.X11-unix -it [image-name:tag] -e DISPLAY=$DISPLAY ./mach run
```

You'll probably also need to allow the connection to your X server.
```
xhost +local:docker
```