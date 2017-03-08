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
    environment:
      PASSWORD: YOUR_PASSWORD
      REGION: YOUR_REGION
      USERNAME: YOUR_USERNAME
    image: brettmcgin/private_internet_access
    ports:
    - <portsNeededByOtherService>
  busybox:
    container_name: busybox
    image: busybox
    network_mode: service:pia
    command: ifconfig | grep inet
version: '2'
```

### Optional run flags
```yml
services:
  pia:
    dns:
    # Google
    - 8.8.8.8
    - 8.8.4.4
    # PIA Dns
    - 209.222.18.222
    - 209.222.18.218
```

## List Regions
```Shell
docker run brettmcgin/private_internet_access ls
```