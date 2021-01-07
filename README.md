# serverless-api

## Migrate DB
`./manage.py migrate`

## Create new user
`./manage.py createsuperuser --username user`

## Create token
`./manage.py drf_create_token user`

## Run server
`./manage.py runserver`

## Build container
`docker build -t django-api .`

## Run container
`docker run -p 8000:80 --name django-api-container --detach django-api`
