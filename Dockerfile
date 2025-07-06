# Build stage
FROM golang:1.21.0-alpine3.17 AS build
WORKDIR /app
COPY . .
RUN go build -o tech-assessment .

# Run stage
FROM alpine:3.18.3
WORKDIR /app
COPY --from=build /app/. .

EXPOSE 3000
CMD ["/app/tech-assessment"]