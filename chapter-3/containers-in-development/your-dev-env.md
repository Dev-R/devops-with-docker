** This was a hard one (Containerizing development environment)

# Client (Next.js):

- Went through README.md to check how to run the app
- Created a dev.Dockerfile to follow the README.md instructions
- Created a docker-compose.dev.yml (context: .)
  \*\* Everything works, except the HMR part.

# API (Express.js, Postgres, Mailhog, Redis)

- Went through README.md to check how to run the app
- Created a dev.Dockerfile to follow the README.md instructions
- Created a entrypoint.sh for Alembic database migrations
- Created a named volume called api-db
- Created a docker-compose.dev.yml (context: .)

## Notes

- I'm yet to create the production file! Hopefully, I get confident enough to deploy my container in production!
- I've omitted many details, but they are essentially the same as the exercises.