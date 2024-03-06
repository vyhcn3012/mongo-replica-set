# MongoDB Replica Set

A Replica Set of MongoDB running in a Docker container

## Not For Production

The key motivation for this image is to have a **ready-made** replica set of MongoDB running inside docker container for CI tests and local development.

To run the container, execute the following command:

```shell
docker run -d -p 37017:37017 -p 37018:37018 -p 37019:37019 candis/mongo-replica-set
```

Wait for 30 to 35 seconds in order to properly start all database instances and replica-set initialization.

## Configuration

Additionally, you can pass an env variable called `HOST` when running the container to configure the replica's hostname in docker. By default, it uses `localhost`.

Once ready, the replica-set can be accessed using the following connection string:

```shell
mongodb://localhost:37017,localhost:37018,localhost:37019/?replicaSet=rs0&readPreference=primary&ssl=false
```

If you're connecting from your host machine, you might need to set a new alias within `/etc/hosts`:

```
# /etc/hosts
127.0.0.1 HOST # where HOST is the value passed as env variable to the container
```
