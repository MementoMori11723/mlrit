# MLRIT Infrastructure

This repository contains a complete Docker-based setup for deploying and managing multiple self-hosted services — **Caddy**, **Docmost**, **n8n**, and **Taiga** — using **Make** for easy orchestration.

---

## 🧩 Project Structure

```
mlrit
├── caddy/           # Reverse proxy and SSL management
│   ├── Caddyfile
│   ├── compose.yml
│   └── Makefile
├── docmost/         # Self-hosted documentation and wiki tool
│   ├── compose.yml
│   ├── example.env
│   └── Makefile
├── n8n/             # Automation and workflow tool
│   ├── compose.yml
│   ├── example.env
│   └── Makefile
├── taiga/           # Project management platform
│   ├── compose.yml
│   ├── compose-inits.yml
│   ├── example.env
│   ├── launch.sh
│   ├── manage.sh
│   ├── Makefile
│   └── taiga.conf
├── Makefile         # Root Makefile to control all services
└── README.md
```

---

## ⚙️ Requirements

Before you begin, make sure you have the following installed:

* [Docker](https://docs.docker.com/get-docker/)
* [Docker Compose](https://docs.docker.com/compose/install/)
* [Make](https://www.gnu.org/software/make/)

---

## 🚀 Usage

All services can be started and stopped with simple `make` commands from the project root.

### Start All Services

```bash
make
```

This will:

* Navigate into each service directory (`caddy`, `docmost`, `n8n`, and `taiga`)
* Run the `make` command in each one (which runs its respective `docker compose` setup)
* Return back to the root directory once done

---

### Stop All Services

```bash
make stop
```

This will:

* Go into each service directory
* Run their `make stop` command (which stops their Docker containers)
* Return to the root directory

---

### Create an Admin User (Taiga)

If you’re setting up **Taiga**, you can create a new admin user by running:

```bash
cd taiga
make admin
```

---

## 🧱 Individual Services

You can also manage each service independently:

| Service     | Directory  | Notes                                                |
| ----------- | ---------- | ---------------------------------------------------- |
| **Caddy**   | `caddy/`   | Handles reverse proxy and HTTPS                      |
| **Docmost** | `docmost/` | Wiki and documentation platform                      |
| **n8n**     | `n8n/`     | Workflow automation tool                             |
| **Taiga**   | `taiga/`   | Project management platform with admin setup command |

---

## 🧹 Cleanup

To stop and remove all containers, networks, and volumes used by these services:

```bash
make stop
```

*(Run from the root or inside any individual service directory.)*

---

## 📄 Notes

* Each service has its own `.env` file — copy from `example.env` before first use.
* Ensure all services run on a shared Docker network if you plan to interconnect them.
* Caddy automatically handles proxying and SSL for all subdomains configured in its `Caddyfile`.
* To change the domain name you can edit the caddy file to do that.

---

## 🏁 Summary

| Command                        | Description                   |
| ------------------------------ | ----------------------------- |
| `make`                         | Start all services            |
| `make stop`                    | Stop all services             |
| `make admin` (inside `taiga/`) | Create a new Taiga admin user |
