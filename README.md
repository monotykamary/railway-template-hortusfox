# HortusFox on Railway

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/hortusfox?referralCode=ZqgrJ0)

Deploy HortusFox 5.9 with generated administrator and MariaDB credentials, durable uploads, and daily-backed-up storage.

The Deploy on Railway button is added after the published route is verified.

## What this deploys

- HortusFox `v5.9`, pinned to its official Linux/AMD64 GHCR image digest
- MariaDB `11.8.5`, pinned to its official Linux/AMD64 digest
- Generated administrator password and database credentials
- One app-data volume plus one database volume, both with daily backups

## Sign in

Open the generated domain and use `APP_ADMIN_EMAIL` and `APP_ADMIN_PASSWORD` from the HortusFox service variables. The first startup waits for MariaDB, runs all migrations, creates application settings, and creates the administrator before the app passes health checks.

## Persistence adapter

Upstream's Compose deployment mounts six writable directories. Railway can preserve the same contract with one `/data` volume: the adapter seeds and symlinks images, attachments, logs, backups, themes, and migrations into that volume before running the unmodified upstream entrypoint. MariaDB data lives on its own volume at `/var/lib/mysql`.

## Operational scope

- The template runs one HortusFox web replica. Do not scale horizontally without validating shared files and sessions.
- SMTP and optional weather or plant-identification providers are not configured by default.
- The adapter temporarily enables debug mode only while the upstream CLI runs first-start migrations, then disables PHP display errors before Apache accepts traffic. Dependency updates at startup remain disabled for deterministic releases.
- Rotate the generated administrator password in the profile after first sign-in if your policy requires application-managed credentials.

## Updating

Update HortusFox and MariaDB tags and digests deliberately, review migrations, take backups, then repeat fresh install, login, location/plant workflows, upload persistence, database persistence, and redeploy soak tests.

## Validation

```bash
npm test
BASE_URL=https://your-domain.example ADMIN_EMAIL=admin@example.com ADMIN_PASSWORD=... python3 scripts/smoke.py
```

## Upstream

- Source: https://github.com/danielbrendel/hortusfox-web/tree/v5.9
- Release: https://github.com/danielbrendel/hortusfox-web/releases/tag/v5.9
- Documentation: https://www.hortusfox.com/documentation
- License: MIT

This repository contains Railway adapters and documentation. HortusFox remains copyright Daniel Brendel and contributors and is not affiliated with Railway.
