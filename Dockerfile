FROM mediawiki:1.35

RUN docker-php-ext-install bcmath && \
    \
    apt-get update && \
    apt-get install -y ghostscript poppler-utils xpdf-utils && \
    rm -rf /var/lib/apt/lists/* && \
    \
    cd /var/www/html/extensions && \
    \
    git clone --depth=1 --branch=REL1_35 https://gerrit.wikimedia.org/r/mediawiki/extensions/PageForms.git && \
    rm -rf ./PageForms/.git && \
    \
    git clone --depth=1 --branch=REL1_35 https://gerrit.wikimedia.org/r/mediawiki/extensions/CreatePage.git && \
    rm -rf ./CreatePage/.git