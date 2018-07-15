# Hallo, Rails!
This is a simple Rails project in Docker that we can use to learn, well, Rails.

## Development Environment

Build Docker containers with:

```
docker-compose build web
```

Create the database(s):

```
docker-compose run web bundle exec rake db:create
```

Run database migrations:

```
docker-compose run web bundle exec rake db:migrate
```

Start the app:

```
docker-compose up web
```

And finally visit the homepage at http://localhost:3000/.
