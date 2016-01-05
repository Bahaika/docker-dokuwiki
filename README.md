### Dokuwiki lighweight image

![Dokuwiki logo](https://raw.githubusercontent.com/HipsterWhale/docker-dokuwiki/master/dokuwiki_logo.png)

#### Usage

```
docker run -d -p 80:80 \
  -v /mnt/volumes/doku/conf:/srv/dokuwiki/conf \
  -v /mnt/volumes/doku/data:/srv/dokuwiki/data \
  --name=dokuwiki bahaika/dokuwiki
```
