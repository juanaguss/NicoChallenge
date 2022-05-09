# roles_challenge

## Running the Application Locally

Run `conduit serve` from this directory to run the application. For running within an IDE, run `bin/main.dart`. By default, a configuration file named `config.yaml` will be used.

To generate a SwaggerUI client, run `conduit document client`.

To try out the application, open an instance of Postman and try out these two calls:

### Sign in:
  Create a `POST` call aiming towards `localhost:8888/signup` and set it up to send a JSON that says something like this
  `{"email": "a@mail.com", "password": "a"}`.
  If it's an unregistered user, then it'll create one using those credentials. Otherwise if the user already exists, it'll return `403 FORBIDDEN`
  
### Log in:
  Create a `GET` call aiming towards `localhost:8888/restricted` and set it up to send a Basic Authorization (Authorization > Type: Basic auth). Then send 
  existing credentials, in which case it'll answer *Hola Mundo!* or, in case credentials are incorrect, it'll return `403 FORBIDDEN`.


The default configuration file used when testing is `config.src.yaml`. This file should be checked into version control. It also the template for configuration files used in deployment.

## Deploying an Application

See the documentation for [Deployment](https://conduit.io/docs/deploy/).
