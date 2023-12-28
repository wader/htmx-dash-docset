# htmx dash docset

[Dash](https://kapeli.com/dash) docset for [htmx](https://htmx.org).

Very much work-in-progress.

### Build
```sh
docker build -t htmx-dash-docset . && \
docker run -v "$PWD:$PWD" -w "$PWD" htmx-dash-docset
```
Add `htmx.docset` to dash `open -a dash htmx.docset`

### Development
```sh
docker build -t htmx-dash-docset . && \
docker run -ti --entrypoint=sh -v "$PWD:$PWD" -w "$PWD" htmx-dash-docset
# in container do
./generate.sh
# to skip clone do
SKIP_CLONE=1 ./generate.sh
```

### TODO

- Some links seems wrong
- More strict `code` selector match
- Add logo
- Generate contrib `docset.json`
- Make sure no external resources are used
- Some script should be enabled?
- Add extensions, guides etc?

### Thanks and licenses

Documentation based on https://htmx.org/reference under BSD license https://github.com/bigskysoftware/htmx/blob/master/LICENSE

HTML generated using [zola](https://www.getzola.org).

Dash docset generated from HTML using [dashing](https://github.com/technosophos/dashing).