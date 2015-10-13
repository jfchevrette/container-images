# Sqitch

[Sqitch](http://sqitch.org/) is a database change management application. This container image currently support MySQL and PostgreSQL.

# How to build

        docker build -t jfchevrette/sqitch .

# How to run

Make sure your database container is up. (called 'mysql' in this example)

```
docker run --rm -it    \
    -v $PWD:/src:ro    \
    --link mysql:mysql \
    sqitch deploy db:mysql://root:password@mysql/<database>
```
