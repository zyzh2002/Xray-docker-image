# Xray docker image

docker build repo for xray

https://hub.docker.com/r/shell20021020/xray-core

## Usage

```bash
docker run --rm shell20021020/xray-core help

docker run --name xray shell20021020/xray-core $xray_args (help, eun etc...)

docker run -d --name xray -v /path/to/config.json:/etc/xray/config.json -p 10086:10086 shell20021020/xray-core run -c /etc/xray/config.json 
```
