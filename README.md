# CustomCloud

## Requirements
* docker
* docker compose

## Useful commands

```
docker compose up -d --build            # create and start the container
docker compose logs custom_cloud        # check logs of the container
docker compose ps                       # check the container is running
docker compose stop                     # stop it, keep everything
docker compose start                    # start it again (no rebuild needed)
docker compose down                     # remove the container, keep the data volume
docker compose down -v                  # remove the container and delete all data
```

Rebuild container from scratch
```
docker compose down -v && docker compose up -d --build && docker compose logs -f custom_cloud
```

Rebuild prostges setup from scratch
```
docker compose -f docker-compose-prostges.yml down -v  &&\
docker compose -f docker-compose-prostges.yml up -d --build &&\
docker compose -f docker-compose-prostges.yml logs -f custom_cloud
```
