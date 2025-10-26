# CozyTemp Flutter Serverpod - Docker Deployment Example

This directory contains a production-ready Docker Compose setup for deploying the CozyTemp Flutter Serverpod server with PostgreSQL and Redis.

## Quick Start

### 1. Prerequisites

- Docker and Docker Compose installed
- Access to GitHub Container Registry (for pulling the server image)

### 2. Authenticate with GitHub Container Registry

If the image is private, authenticate with GitHub:

```bash
echo $GITHUB_TOKEN | docker login ghcr.io -u YOUR_GITHUB_USERNAME --password-stdin
```

Or create a Personal Access Token (PAT) with `read:packages` permission and use it instead.

### 3. Configure Environment Variables

**This is the ONLY file you need to configure!** All settings are in `.env`:

```bash
cp .env.example .env
nano .env  # or use your preferred editor
```

Key variables to customize for **production**:
- `POSTGRES_PASSWORD` - Strong password for PostgreSQL
- `REDIS_PASSWORD` - Strong password for Redis
- `SERVICE_SECRET` - Secret key for Serverpod service authentication
- `API_HOST`, `INSIGHTS_HOST`, `WEB_HOST` - Your domain names
- `PUBLIC_PORT` - 443 for HTTPS, 80 for HTTP
- `PUBLIC_SCHEME` - `https` for production, `http` for local testing

The `.env` file is already configured for local testing with default passwords.

### 4. Start the Services

```bash
docker-compose up -d
```

This will:
- Pull the latest `flutter-server` image from GitHub Container Registry
- Start PostgreSQL with pgvector extension
- Start Redis with password authentication
- Start the Serverpod server in production mode

### 5. Check Status

```bash
# View running containers
docker-compose ps

# View logs
docker-compose logs -f

# View logs for a specific service
docker-compose logs -f flutter-server
```

### 6. Access the Services

- **API Server**: http://localhost:8080
- **Insights Server**: http://localhost:8081
- **Web Server**: http://localhost:8082
- **PostgreSQL**: localhost:5432
- **Redis**: localhost:6379

## Services

### Flutter Server
- **Image**: `ghcr.io/tryy3/cozytemp_flutter_serverpod/flutter-server:latest`
- **Ports**: 8080 (API), 8081 (Insights), 8082 (Web)
- **Config**: Mounted from `./config` directory

### PostgreSQL
- **Image**: `pgvector/pgvector:pg16`
- **Port**: 5432
- **Volume**: `postgres_data` for persistent storage
- **Health checks**: Enabled

### Redis
- **Image**: `redis:6.2.6-alpine`
- **Port**: 6379
- **Volume**: `redis_data` for persistent storage
- **Persistence**: AOF (Append-Only File) enabled

## Configuration Files

### `docker-compose.yml`
Main orchestration file defining all services, networks, and volumes.

### `.env`
**THE ONLY FILE YOU NEED TO CONFIGURE!** All settings are stored here as environment variables. The config files are auto-generated at container startup. **IMPORTANT**: Keep this file secure and never commit it to version control.

### `entrypoint.sh`
Auto-generates Serverpod configuration files (`production.yaml` and `passwords.yaml`) from environment variables at container startup. This means you only need to maintain the `.env` file!

## Updating the Server

Pull the latest image and restart:

```bash
docker-compose pull flutter-server
docker-compose up -d flutter-server
```

## Database Migrations

To run database migrations, exec into the running container:

```bash
docker-compose exec flutter-server /bin/sh
# Then run your migration commands
```

## Stopping Services

```bash
# Stop all services
docker-compose down

# Stop and remove volumes (WARNING: This will delete all data!)
docker-compose down -v
```

## Troubleshooting

### Server won't start
1. Check logs: `docker-compose logs flutter-server`
2. Verify database is healthy: `docker-compose ps postgres`
3. Ensure all required variables are set in `.env` file (especially passwords)

### Cannot connect to database
- Verify PostgreSQL is running: `docker-compose ps postgres`
- Check database credentials in `.env` file

### Redis connection issues
- Verify Redis is running: `docker-compose ps redis`
- Check `REDIS_PASSWORD` in `.env` file

## Production Deployment

For production deployment:

1. **Update domains** in `.env`:
   - Set `API_HOST`, `INSIGHTS_HOST`, `WEB_HOST` to your actual domains
   - Set `PUBLIC_SCHEME` to `https`
   - Set `PUBLIC_PORT` to `443`

2. **Use strong passwords**:
   - Generate secure passwords for `POSTGRES_PASSWORD`, `REDIS_PASSWORD`, and `SERVICE_SECRET`
   - Update the `.env` file only

3. **Add SSL/TLS termination**:
   - Use a reverse proxy (Nginx, Traefik, Caddy) in front of the services
   - Or use a cloud load balancer with SSL

4. **Backup volumes**:
   - Set up regular backups for `postgres_data` and `redis_data`

5. **Monitor services**:
   - Set up logging and monitoring solutions
   - Use health check endpoints

6. **Resource limits**:
   - Add resource limits to docker-compose.yml for production workloads

## Security Notes

- **Never commit `.env` to version control** (it's already in `.gitignore`)
- Use strong, unique passwords for all services
- Keep the Docker images updated regularly
- Enable SSL/TLS for production deployments
- Restrict network access to only necessary ports
- Configuration files (`production.yaml`, `passwords.yaml`) are auto-generated at runtime from `.env` - no manual maintenance needed!

## Support

For issues with:
- **Server code**: Check the main project repository
- **Serverpod framework**: Visit [Serverpod documentation](https://serverpod.dev)
- **Docker setup**: Review Docker Compose logs

