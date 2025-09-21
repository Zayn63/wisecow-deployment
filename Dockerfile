FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    fortune-mod \
    cowsay \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

# ✅ Fix PATH so cowsay and fortune are found
ENV PATH="/usr/games:${PATH}"

EXPOSE 4499
CMD ["/app/wisecow.sh"]
