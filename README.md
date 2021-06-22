# docker_configs

## Building the images

### nodejs
```shell
docker build -t nodejs:1.0 nodejs/
```

### yocto
```shell
docker build -t yocto:1.0 yocto/
```

## Script usage
Start with start.sh -
```shell
-y|-j Use yocto-build-env/nodejs-env container(y is the default value)
-x    Use X11 forwarding
-n    Forward /dev/net/tun
-p    Run container in privileged mode
-e    Execute additional instance
```
