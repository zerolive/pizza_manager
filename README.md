# Pizza Manager

An Web application for manage pizza's ingredients and its prize

## Project planification

You can find the planification of this project in the follow [trello.](https://trello.com/b/XP0VRpMB/pizza-manager)

# Repository

You can find the application's code in github on this [repository.](https://github.com/zerolive/pizza_manager)

# Continuous Integration

This project is linked with a CI in [Travis-CI](https://travis-ci.org/zerolive/pizza_manager)

# Demo Environment

After every commit that pass the CI is automatly deployed in Heroku, you can visit de application clicking [here](https://pizza-manager.herokuapp.com/).

# Running the application

## System requirementes

- docker-compose version 1.18.0 or higher
- Docker version 17.12.0-ce or higher

## Development

If you want to run the application in your local, you have to run the follo command:

- `docker-compose up --build`

After that you can access to the application in your browser in ´http://ĺocalhost:3000´

## Tests

For run the tests you have to run the app with:

- `docker-compose up --build`

After that you have to run in other terminal:

- `docker-compose exec pizza rake`
