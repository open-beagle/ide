# ide

```bash
docker run -it --rm \
  -p 11022:22 \
  -v $PWD/:$PWD/ \
  -w $PWD/ \
  registry.cn-qingdao.aliyuncs.com/wod/debian:12 \
  bash scripts/install.sh
```
