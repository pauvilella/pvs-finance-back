ARG PYTHON_VERSION=3.10
FROM python:${PYTHON_VERSION}-alpine

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

RUN apk update \
    && apk upgrade --available \
    && apk add bash poetry

WORKDIR /app
COPY ./app .
EXPOSE 80

COPY poetry.lock pyproject.toml ./
ARG POETRY_DEV=false
RUN poetry export -f requirements.txt -o /tmp/requirements.txt --without-hashes $(test "$POETRY_DEV" = "true" && echo "--with dev") && \
    python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    rm -rf /tmp && \
    adduser --disabled-password --no-create-home django-user

ENV PATH="/py/bin:$PATH"

USER django-user