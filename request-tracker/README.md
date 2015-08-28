# Request Tracker in a container

This container runs a full installation of [Request-Tracker](https://www.bestpractical.com/rt/) from [Best Practical](https://www.bestpractical.com). It is customizable and can be used as a base image for further customizations such as adding extensions.

The RT container expects a separate MySQL/MariaDB container to be available to connect to.

# How to build

        # Request-Tracker version 3
        docker build -t request-tracker 3/

        # Request-Tracker version 4
        docker build -t request-tracker 4/

# How to run

Start a MariaDB/MySQL container that will host the database

        docker run -d --name rt-db \
            -e MYSQL_ROOT_PASSWORD=secure \
            mariadb

Run the request tracker container once and initialize the database

        docker run -it --rm \
            --link rt-db:db \
            request-tracker \
            /opt/rt3/sbin/rt-setup-database --action init --dba root --dba-password secure

Run the request tracker in the background

        docker run -dP \
            --link rt-db:db \
            request-tracker

# How to customize

The instance can be customized by setting environment variables when running the container.

| Variable | RT_SiteConfig | Default | Description |
| -------- | ------------- | ------- | ----------- |
| RTNAME | $rtname | rt.example.com | Name of your RT instance |
| ORGANIZATION | $Organization | rt.example.com | Name of your organization |
| OWNER_EMAIL | $OwnerEmail | support@example.com | Email address where errors will be sent to |
| LOG_LEVEL | $LogToSTDERR | info | Log level of logs sent to STDERR |
| DATABASE_HOST | $DatabaseHost | db | Your database host (hostname of your linked container) |
| DATABASE_PORT | $DatabasePort | _empty_ | Your database port |
| DATABASE_NAME | $DatabaseName | rt3 | RT database name |
| DATABASE_USER | $DatabaseUser | rt_user | RT database username |
| DATABASE_PASSWORD | $DatabasePassword | rt_pass | RT database password |
| DATABASE_RT_HOST | $DatabaseRTHost | _%_ | Hostname which will be used when creating the database GRANT (ex: 'rt_user'@'%') |

For example:

        docker run -dP \
                --link rt-db:db \
                -e RTNAME=rt.mycompany.com \
                -e ORGANIZATION='My Company' \
                -e OWNER_EMAIL='cio@mycompany.com \
                request-tracker

More details on each variable is available here: 
- [RT 3.8 docs](https://www.bestpractical.com/docs/rt/3.8/RT_Config.html)
- [RT 4.2 docs](https://www.bestpractical.com/docs/rt/4.2/RT_Config.html)


# TODO

- Add a SMTP server to allow RT to receive emails
- Add a framework to make installing extensions easier and straightforward.
- Add support for PostgreSQL
- Add support for RT 4.2
