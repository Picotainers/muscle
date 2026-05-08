# muscle

## Quick Usage

```bash
# Pull the image
docker pull docker.io/picotainers/muscle:latest

# Run the tool
docker run --rm -v "$(pwd):/data" docker.io/picotainers/muscle:latest --help
```

## Example Alignment

```bash
docker run --rm -v "$(pwd):/data" docker.io/picotainers/muscle:latest --align /data/query.fasta --output /data/query.aln
```
