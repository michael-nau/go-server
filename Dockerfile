FROM golang:1.23

WORKDIR /app

# Download Go modules
COPY go.mod go.sum ./
RUN go mod download

RUN go mod download
COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /server
EXPOSE 8080

CMD ["/server"]