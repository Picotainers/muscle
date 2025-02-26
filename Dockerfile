FROM debian:bullseye-slim AS builder

RUN apt-get update && \
   apt-get install -y git make gcc zlib1g-dev upx-ucl g++ 


RUN git clone https://github.com/rcedgar/muscle.git && \
   \    
  cd muscle/src && \
  bash build_linux.bash && \

  upx /muscle/src/Linux/muscle && \
  mkdir -p /data


 
FROM gcr.io/distroless/base

# Copy the muscle binary from the builder image
COPY --from=builder /muscle/src/Linux/muscle /usr/local/bin/muscle
COPY --from=builder /data /data
WORKDIR /data
# Set the entrypoint
ENTRYPOINT ["/usr/local/bin/muscle"]
