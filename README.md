# Pgbouncer

PostgreSQL connection pooler.

Simple out-of-box `pgbouncer`.


## Usage

Mount your configuration directory as a volume:

```
docker run -v <pgbouncer_config_dir>:/etc/pgbouncer:ro firmapi/docker-pgbouncer
```

You can also add the logging directory:

```
docker run -v <pgbouncer_config_dir>:/etc/pgbouncer:ro -v <logging_dir>:/log/postgresql:rw -p <port>:6432 firmapi/docker-pgbouncer
```

You can use [supplied config files](https://github.com/Kotaimen/docker-pgbouncer/tree/develop/pgbouncer), which are copied from a fresh debian installation.  Also check pgbouncer's official [config file documentation](https://pgbouncer.github.io/config.html).

By default, pgbouncer writes logs to:

    /var/log/postgresql/

And listens on:

    0.0.0.0:6432
