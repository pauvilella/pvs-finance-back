ARG PYTHON_VERSION=3.10
FROM python:${PYTHON_VERSION}-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

EXPOSE 80

WORKDIR /app

RUN --mount=type=cache,mode=0777,target=/var/cache/apt \
    apt-get update; apt-get dist-upgrade -y

# poetry
RUN pip install poetry==1.2.1
COPY poetry.lock pyproject.toml ./
ARG POETRY_DEV=false
RUN --mount=type=cache,mode=0777,target=/root/.cache/pip \
    poetry export -f requirements.txt -o requirements.txt --without-hashes $(test "$POETRY_DEV" = "true" && echo "--dev") \
    && pip install -r requirements.txt
# end poetry

COPY . .