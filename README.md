# Controles ManServ - Baserow Setup

A containerized Baserow deployment configured for local network access with a friendly hostname.

## Overview

This project provides a Docker-based Baserow installation that can be accessed by other computers on your local network using the friendly name `controles-manserv.local` instead of IP addresses.

## Features

- **Friendly Network Access**: Access via `http://controles-manserv.local`
- **Docker Containerized**: Easy deployment and management
- **Network Ready**: Configured for multi-computer access
- **Windows Compatible**: Includes setup script for Windows clients

## Quick Start

### 1. Start Baserow Server (Linux Host)

```bash
# Start the Baserow container
docker run \
  -d \
  --name baserow \
  -e BASEROW_PUBLIC_URL=http://controles-manserv.local \
  -v baserow_data:/baserow/data \
  -p 80:80 \
  -p 443:443 \
  --restart unless-stopped \
  baserow/baserow:1.35.1
```

### 2. Setup Network Access for Windows Clients

1. Copy `setup-controles-manserv.bat` to each Windows computer
2. Right-click the file and select "Run as administrator"
3. Access Baserow at: `http://controles-manserv.local`

## Configuration Details

### Server Configuration
- **Host**: Ubuntu Linux (controles-manserv)
- **IP Address**: 10.100.10.208
- **Baserow Version**: 1.35.1
- **Ports**: 80 (HTTP), 443 (HTTPS)

### Network Setup
- **Hostname**: controles-manserv
- **mDNS**: Configured via Avahi
- **Hosts File**: Local entries for name resolution

## Files

- `docker-compose.yml`: Docker run configuration
- `setup-controles-manserv.bat`: Windows client setup script
- `/etc/avahi/services/controles-manserv.service`: mDNS service definition

## Troubleshooting

### Cannot Access from Windows
1. Ensure the setup script was run as administrator
2. Test connectivity: `ping controles-manserv.local`
3. Check firewall settings on the Ubuntu host

### Docker Container Issues
```bash
# Check container status
docker ps --filter name=baserow

# View logs
docker logs baserow

# Restart container
docker restart baserow
```

### Network Connectivity
```bash
# Test local resolution
ping controles-manserv.local

# Check Avahi service
systemctl status avahi-daemon

# View network configuration
ip addr show
```

## Requirements

### Ubuntu Host
- Docker installed
- Avahi daemon running
- Ports 80/443 open in firewall

### Windows Clients
- Network connectivity to Ubuntu host
- Administrator privileges for hosts file modification

## Security Notes

- This setup is intended for local network use
- Consider implementing HTTPS for production environments
- Firewall rules should restrict access to trusted network segments

## Version History

- **v1.0**: Initial setup with Baserow 1.35.1 and friendly hostname configuration

## License

This configuration is provided as-is for local network deployment of Baserow.
