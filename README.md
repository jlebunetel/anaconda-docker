# anaconda-docker
Toolbox to run Anaconda in a container.

## Installation

### Requirements
- [Docker](https://docs.docker.com/get-docker/): we use _Docker_ to run __Anaconda__. This is a strict requirement to use this project.
- [Docker Compose](https://docs.docker.com/compose/install/): we use _Docker Compose_ to simplify the orchestration of services using [docker-compose.yml](docker-compose.yml) configuration file.

Download this repository and unzip it on your computer. You should rename the folder `anaconda-docker-main` in `anaconda-docker`.

Or clone the repository directly on your computer:
``` bash
$ git clone git@github.com:jlebunetel/anaconda-docker.git
```

### Quickstart
To start _Docker_ services, please run:
``` bash
$ make quickstart
```

Wait a bit for the main container to build, then you can run a shell into it with the following command:
``` bash
$ make shell
```

That's all!

There may be a conflict if port `8888` on your machine is already in use. In this case, you can change it with the following command with a suitable port number:
``` bash
$ JUPYTER_PORT=8888 make quickstart
```

To stop the demo application and remove all containers and volumes, please run:
``` bash
$ make stop
```

To remove all containers and volumes, please run:
``` bash
$ make clean
```

### Getting help
To list all available commands, please run:
``` bash
$ make help
```

## Tech/framework used
- [Anaconda](https://www.anaconda.com/) is a distribution of the Python and R programming languages for scientific computing (data science, machine learning applications, large-scale data processing, predictive analytics, etc.), that aims to simplify package management and deployment.

## Contributing
For the sake of simplicity, to ease interaction with the community, we use the [GitHub flow](https://guides.github.com/introduction/flow/index.html) for open-source projects. In a few words:
* The `main` branch is always stable and deployable;
* Tags from the `main` branch are considered as releases;
* Contributors have to fork or create a new feature-branch to work on (if they are allowed to in the original repository) and propose a pull request to merge their branch to `main`.

If you'd like to contribute, please raise an issue or fork the repository and use a feature branch. Pull requests are warmly welcome!

## Versioning
We use [SemVer](http://semver.org/) for versioning. See the [CHANGELOG.md](CHANGELOG.md) file for details.

## Licensing
The code in this project is licensed under MIT license. See the [LICENSE](LICENSE) file for details.
