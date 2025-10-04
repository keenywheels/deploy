# Deployer

Интрумент для деплоя сервиса [vixar.tech](https://vixar.tech)

### Зависимости

- _ansible_ - `sudo apt install ansible -y`

### Команды

- `make ping` - пингануть каждый хост из списка `inventory/hosts.ini`
- `make play-<playbook>` - запустить playbook из директории `playbooks/`

### Доступные playbook'и

- `deploy-nginx` - обновить конфиг nginx на сервере. Можно обновлять как сервис `front-nginx` в `apps/nginx/compose.yaml`, так и конфиги самого nginx `apps/nginx` 
- `deploy-front` - загрузить `dist/` фронтенда на сервер (путь до `dist/` указан в переменной окружения `VIXAR_DIST_PATH`, которая по умолчанию равна `../front/dist`), поэтому сначала нужно собрать фронт командой `bun run build` в репозиторияя фронтенда
- `install-docker` - установить _docker_ и _docker compose_ на сервер

Нужные playbook'и запускаются сами после слияния с `master`'ом
