# Private Internet Access
Private Internet Access docker container

## Docker run usage
```Shell
docker run \
  --cap-add=NET_ADMIN
  --device=/dev/net/tun
  --name=pia \
  -e 'USERNAME=PIA_USERNAME' \
  -e 'PASSWORD=PIA_PASSWORD' \
  brettmcgin/private_internet_access
```

### Optional run flags
```Shell
  --dns 209.222.18.222 \
  --dns 209.222.18.218 \
```

## Docker Compose
```yml
services:
  pia:
    cap_add:
    - NET_ADMIN
    container_name: pia
    devices:
    - /dev/net/tun
    dns:
    - 8.8.8.8
    - 8.8.4.4
    environment:
      PASSWORD: YOUR_PASSWORD
      REGION: YOUR_REGION
      USERNAME: YOUR_USERNAME
    image: brettmcgin/private_internet_access
    ports:
    - <portsNeededByOtherService>
    privileged: true
  busybox:
    container_name: busybox
    image: busybox
    network_mode: service:pia
    command: ifconfig | grep inet
version: '2'
```

## List Regions
```Shell
docker run brettmcgin/private_internet_access ls
```