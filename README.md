# pvs-finance-back
PVS Finance project - backend

### Commands used:
```bash
poetry install
poetry add black --group dev
docker-compose run --rm app bash -c "django-admin startproject app ."
docker-compose build
docker-compose up
```

Then, the backend runs in http://localhost:7777

Format all the project in the beggining:
```bash
black .
```

Test command (out-of-the-box Django Test Framework):
```bash
docker-compose run --rm app bash -c "python manage.py test"
```

Lint command:
```bash
docker-compose run --rm app bash -c "flake8"
```