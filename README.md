Чтобы Ansible мог подключаться к контейнеру необходимо добавить публичный ключ в переменную окружения:

```shell
export SSH_PUBLIC_KEY="$(cat $HOME/.ssh/id_rsa.pub)"
```

и собрать контейнер:

```shell
docker-compose up --build
```

