# pvs-finance-back
PVS Finance project - backend

### Commands used:
```bash
poetry install
docker-compose run pvs-finance-back django-admin startproject back .
docker-compose build
docker-compose up
```

Then, the backend runs in http://localhost:7777

Format all the project in the beggining:
```bash
black .
```

Create the first app
```bash
python manage.py startapp accounts
```