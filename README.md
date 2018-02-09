# Dawn of Light - Docker

This repo is a one-stop place to build Dawn of Light and run it with Docker.

## TL;DR
```bash
./bin/compile.sh
./bin/compile_database.sh
docker-compose up database
# Wait some time for the data to load, you'll see a message near the bottom
# that says something along the lines of:
#
#   [Note] mysqld: ready for connections.
docker-compose up server
```

## Instructions

Before building any docker images you need to fetch and grab the latest stable
working source for Dawn of Light.  This whole process is taken care of for you
by running `./bin/compile.sh` from the root level of this project directory.

This will fetch the source from the Eve of Darkness team repo; use the mono
docker image to compile it, and stage everything neatly into the following
directory for use by the Dockerfile:

```
./workspace/DOLSharp/Debug/
```

If you want to use the database you will also want to compile the Eve of
Darkness public database script.  This can be done by running
`./bin/compile_database.sh` from the root level of this project dirctory.

This fetches the database project from github and builds mysql script that
can build and populate a mysql database.

Once Dawn of light is built you can now build the Dawn of Light docker image
or use the provided `docker-compose.yml` to start up the Dawn of Light Service.
If you are using docker-compose, start the provided database first and give
it some time to populate the database.  This is done by running:

```bash
docker-compose up database
```

You'll know when the database is done loading the data on creation by the
message of:

> [Note] mysqld: ready for connections.

This will appear near the bottom of the console output of the database once it
has quietened down.  Once it has you can stop the database by pressing `ctrl + c`.
Now the whole thing can be started up with:

```
docker-compose up
```

If you would like to play with a build image already I have uploaded one to
dockerhub under [benfalk/dol](https://hub.docker.com/r/benfalk/dol/)

Any questions or updates feel free to an issue / pull request!
