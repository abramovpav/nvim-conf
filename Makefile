build:
    docker build -t project-nvim .

run:
    docker run --rm -it -v /path/to/code:/path/to/code project-nvim bash
