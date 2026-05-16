FROM ghcr.io/engineer-man/piston:latest

# Piston data directory
VOLUME ["/piston/packages"]

EXPOSE 2000

CMD ["node", "/piston/api/src/index.js"]