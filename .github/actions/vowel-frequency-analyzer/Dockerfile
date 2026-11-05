FROM python:3.9-slim

WORKDIR /app

COPY . /action

ENTRYPOINT ["/bin/bash", "/github/workspace/.github/scripts/entrypoint.sh"]
