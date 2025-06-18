FROM r-base:4.4.3

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV RENV_PATHS_ROOT=/app/renv
RUN apt-get update && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libgit2-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    build-essential \
    ca-certificates \
    locales\
    python3 \
    python3-pip \
    python3-venv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8
WORKDIR /app
COPY . .
RUN R -e "options(repos = c(REPO = 'https://packagemanager.posit.co/cran/latest')); install.packages('renv')"
RUN R -e "Sys.setenv(RENV_PATHS_ROOT = normalizePath('./renv')); options(renv.verbose = TRUE); renv::restore(prompt = FALSE)"
CMD ["R"]


