# Deploy and Host HortusFox on Railway

## About Hosting HortusFox

HortusFox is a collaborative plant-management application for locations, plants, photos, care tasks, inventory, calendar entries, chat, history, and API integrations. This template deploys stable version 6.1 — which carries upstream's 6.0 XSS and 6.1 backup-import security fixes — with MariaDB and generated administrator credentials.

Sign in using `APP_ADMIN_EMAIL` and the generated `APP_ADMIN_PASSWORD` service variable.

## Common Use Cases

- Track indoor, outdoor, office, or community plants by location
- Record care tasks, notes, photos, history, and inventory
- Share a plant workspace with multiple trusted users

## Dependencies for HortusFox Hosting

### Deployment Dependencies

- HortusFox web service with a daily-backed-up data volume
- Private MariaDB 11.8.9 with a daily-backed-up database volume
- Optional external SMTP and plant information providers

### Implementation Details

The upstream image performs first-run migrations and administrator creation. The Railway adapter preserves upstream's six writable directories under one `/data` volume before delegating to the original entrypoint. MariaDB is available only over Railway private networking. Debug mode and dependency updates at startup are disabled.

The template is a single web replica. Do not scale horizontally until shared files and sessions are explicitly validated.

## Why Deploy HortusFox on Railway?

Railway supplies managed HTTPS, generated credentials, private database networking, persistent volumes with backups, health checks, and repeatable deployments for a complete plant-management workspace.
