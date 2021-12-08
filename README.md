<div align="center">

# Boilerplate for Python Dash Projects

[![Build status](https://github.com/MaaniBeigy/dash-boilerplate/workflows/build/badge.svg)](https://github.com/MaaniBeigy/dash-boilerplate/actions?query=workflow%3Abuild)
[![coverage report](assets/images/coverage.svg)](.logs/coverage.txt)
[![static analysis](assets/images/mypy.svg)](.logs/mypy.txt)
[![vulnerabilities](assets/images/vulnerabilities.svg)](.logs/safety.txt)
[![lint report](assets/images/pylint.svg)](.logs/pylint-log.txt)
[![Dependencies Status](assets/images/dependencies.svg)](.logs/dependencies.txt)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FMaaniBeigy%2Fdash-boilerplate.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2FMaaniBeigy%2Fdash-boilerplate?ref=badge_shield)

[![interrogate](assets/images/interrogate_badge.svg)](.logs/docstring.txt)
[![maintainability](assets/images/maintainability.svg)](.logs/maintainability.txt)
[![complexity](assets/images/complexity.svg)](.logs/complexity.txt)
[![Code style: black](assets/images/codestyle.svg)](https://github.com/psf/black)
[![Security: bandit](assets/images/security.svg)](https://github.com/PyCQA/bandit)
[![Pre-commit](assets/images/precommits.svg)](.pre-commit-config.yaml)
[![license](assets/images/licence.svg)](LICENSE)

Production-ready (i.e., dockerized) dash app boilerplate

</div>

### Development

Uses gunicorn + nginx.

1. Rename *.env.dev.example* to *.env.dev*.
2. Update the environment variables in the *docker-compose.yml* and *.env.dev* files.
3. Build the images and run the containers:

    ```sh
    docker-compose up -d --build
    ```
    Test it out at [http://localhost:1337](http://localhost:1337). The "web" folder is mounted into the container and your code changes apply automatically.

4. Check the logs if necessary:

    ```sh
    docker-compose -f docker-compose.yml logs -f
    ```

5. Drop the container when you are done:

    ```sh
    docker-compose -f docker-compose.yml down -v
    ```



### Production

Uses gunicorn + nginx.

1. Rename *.env.prod.example* to *.env.prod*. Update the environment variables.
2. Build the images and run the containers:

    ```sh
    docker-compose -f docker-compose.prod.yml up -d --build
    ```
    Test it out at [http://localhost:1337](http://localhost:1337). No mounted folders. To apply changes, the image must be re-built.


3. Check the logs if necessary:

    ```sh
    docker-compose -f docker-compose.prod.yml logs -f
    ```

4. Drop the container when you are done:

    ```sh
    docker-compose -f docker-compose.prod.yml down -v
    ```

### Local testing and generating badges:

```bash
python3.9 -m venv .venv_39
. .venv_39/bin/activate
python3 -m pip install --upgrade pip poetry
make install
make pre-commit-install
make test && make coverage && make check-codestyle && make mypy && make check-safety && make extrabadges
```

### Upload code to GitHub:

```bash
pre-commit run --all-files
git add .
git commit -m ":tada: Initial commit"
git push -u origin main
```

### Credits

[testdrivenio/flask-on-docker](https://github.com/testdrivenio/flask-on-docker)


## License
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FMaaniBeigy%2Fdash-boilerplate.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2FMaaniBeigy%2Fdash-boilerplate?ref=badge_large)