# ft_server
This project introduces the following topics:
- PHPMyAdmin configuration and setup
- Nginx configuration for simple HTTP -> 301 -> HTTPs redirect, TLSv1.2, etc.
- WordPress website basic configuration
- *Docker*, which is really helpful and pretty useful towards automation

## How the project works
The idea for this project is to setup and run a single container with a lot of services. It must not be taken as a serious production project, but as a simple introduction towards services and containers.

In this project you have to setup a Debian container, which uses Nginx and TLSv1.2 self-signed certificate.

Packages used and some extra information can be found under Dockerfile.

## Testing the container
You simply need a Docker container runtime. Build (`docker build <path/to/Dockerfile> -t <image-name>`) and execute (`docker run --rm -p 80:80 -p 443:443 <image-name>`) the image.

Then go to `localhost`. Navigating to `localhost/autoindex` should toggle Nginx autoindex. I used a schedule to determine whether it should be on or off.

You can change database password by updating local variable `ROOT_PSWD` before building the container.

## Score
This project was really easy and straight-forward to make, and was finished under the specified time. It has a lot of things to be improved, but as of now I'm not really into system administration.

![Visual proof of success](https://i.imgur.com/6Puj7VL.png)
