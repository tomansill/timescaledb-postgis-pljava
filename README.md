# PL/Java in [timescale/timescaledb-postgis](https://hub.docker.com/r/timescale/timescaledb-postgis) Docker Image

[Timescale](https://www.timescale.com/) + [PostGIS](https://postgis.net/) + [PL/Java](https://tada.github.io/pljava/) in a single Docker image.

## Motivation

I needed a Postgres Database in a Docker container that comes with a time series querying capability that [Timescale Database](https://www.timescale.com/) provides along with Geospatial querying capability that [PostGIS](https://postgis.net/) provides. Such image exists, it is [timescale/timescaledb-postgis](https://hub.docker.com/r/timescale/timescaledb-postgis).  

However, I demand **more**. I need [PL/Java](https://tada.github.io/pljava/) functionality built-in so Postgres will be able to execute stored procedures in Java. No Docker image exists that provides [Timescale](https://www.timescale.com/) + [PostGIS](https://postgis.net/) + [PL/Java](https://tada.github.io/pljava/) in a single image.

So, I created a Dockerfile that creates image that I needed.

## Disclaimer

I created this Dockerfile rather quickly. I did not take the time to carefully optimize the Dockerfile layering and caching and stuff. Nor I did have carefully followed best practices of installing Java runtime as needed by PL/Java. So there may be a lot of ugly hacks in the Dockerfile. I might or might not fix those "hacks" in the future. But you are welcome to create a pull request to fix those.
