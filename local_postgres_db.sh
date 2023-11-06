#!/bin/bash

# Example of script to set up local postgres database defined by docker-compose-postgres.yml
# schema and data defined using Yoyo

# Prerequisite - developer must set this in .zshrc or other shell config
# export RDS_CLUSTER_ENDPOINT="http://127.0.0.1:8080"
# To run in Pycharm, set the environment variable:
# Edit Configurations -> Edit Configuration Templates -> Python tests
# -> Autodetect -> Add environment variable.

docker compose -f docker-compose-postgres.yml up -d

CONTAINER="kp-local-dev-postgres"
USERNAME="postgres"
PASSWORD="example"

sleep 20


# Apply the migrations - uses config from yoyo.ini
yoyo apply

# Apply the Row Level Security / Multi Tenant Migrations
# Uncomment to see multi tenant demonstration
#yoyo apply --database 'postgresql://postgres:example@localhost:5432/localdev_postgres' "$PWD"/migrations_multi_tenant -b

# Apply the seeds
yoyo apply --database 'postgresql://postgres:example@localhost:5432/localdev_postgres' "$PWD"/seeds -b
