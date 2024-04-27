#!/bin/sh

if [ "$SKIP_CLONE" = "" ]; then
    rm -rf work
    mkdir -p work
    git clone https://github.com/bigskysoftware/htmx.git work/htmx
fi

# TODO: figure out better site.css fix
sed -i work/htmx/www/themes/htmx-theme/templates/base.html \
    -e 's/href="\//href="/' \
    -e 's/<script/<!--script/' \
    -e 's/<\/script>/<\/script -->/' \
    -e 's/<link rel="stylesheet" href="css\/site.css">/<link rel="stylesheet" href="css\/site.css"><link rel="stylesheet" href="..\/css\/site.css"><link rel="stylesheet" href="..\/..\/css\/site.css">/'

sed -i work/htmx/www/themes/htmx-theme/static/css/site.css \
    -e 's/max-width: 40em/max-width: 90%/'

echo '.top-nav { display: none !important; }' >> work/htmx/www/themes/htmx-theme/static/css/site.css
echo 'footer { display: none !important; }' >> work/htmx/www/themes/htmx-theme/static/css/site.css

(cd work/htmx/www && zola build)

rm -rf work/htmx/www/public/img
rm -rf work/htmx/www/public/node_modules
rm -rf work/htmx/www/public/essays
rm -rf work/htmx/www/public/posts
rm -rf work/htmx/www/public/talk
rm -rf work/htmx/www/public/test
rm -rf work/htmx/www/public/atom.xml

dashing build --source work/htmx/www/public
