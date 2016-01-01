### Dokuwiki lighweight image

#### Usage

```
docker run -d -p 80:80 \
  -v /mnt/volumes/doku/conf:/srv/dokuwiki/conf \
  -v /mnt/volumes/doku/data:/srv/dokuwiki/data \
  --name=dokuwiki bahaika/docker-dokuwiki
```
