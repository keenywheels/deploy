# Deployer

Интрумент для деплоя сервиса [vixar.tech](https://vixar.tech)

### Настройка

1. Устновить _ansible_: `sudo apt install ansible -y`
2. Положить ключ `vixar.pem` в директорию `~/.ssh/`
3. Добавить в файл `~/.ssh/config` хост:
```sh
Host vixar
  User ubuntu
  Hostname vixar.tech
  IdentityFile ~/.ssh/vixar.pem
```

### Команды

- `make ping` - пингануть каждый хост из списка `inventory/hosts.ini`
- `make play-<playbook>` - запустить playbook из директории `playbooks/`
- `make app-<app>` - создать новый app

### Доступные playbook'и

- `deploy-<app>` - развернуть или обновить `apps/<app>` на сервере
- `install-docker` - установить _docker_ и _docker compose_ на сервер
- `setup-ssl` - настраивает https для домена с помощью let's encrypt и автоматически обновляет сертификаты. Проверка сертификатов происходит раз в сутки в 3 часа ночи 

Нужные playbook'и запускаются сами после слияния с `master`'ом
