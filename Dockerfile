FROM python:3.9


ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_HOME="/opt/poetry" \
    POETRY_VIRTUALENVS_CREATE=false \
    POETRY_NO_INTERACTION=1 \
    PYSETUP_PATH="/opt/pysetup"

RUN apt-get update && apt-get install -y \
                                gcc g++  build-essential\
                                python-distribute python-dev python3-dev \
                                fonts-takao-gothic \
                                git \


RUN curl -sSL https://install.python-poetry.org | python -
ENV PATH="$POETRY_HOME/bin:$PATH"

WORKDIR $PYSETUP_PATH
COPY ./pyproject.toml ./
COPY ./poetry.lock ./

RUN poetry install


