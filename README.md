# cute950_infra
cute950 Infra repository

## ДЗ "Знакомство с облачной инфраструктурой. Yandex.Cloud"
### Способ подключения к someinternalhost в одну команду
```sh
$ ssh -J appuser@<bastion_IP> appuser@<someinternalhost_IP>
```
### Вариант решения для подключения из консоли при помощи алиасов
Отредактировать / создать файл конфигурации SSH для текущего пользователя ~/.ssh/config
```sh
$ nano ~/.ssh/config
```

добавив в него следующие строки:
```sh
Host bastion
    HostName <bastion_IP>
    User appuser
    IdentityFile ~/.ssh/appuser

Host someinternalhost
    HostName <someinternalhost_IP>
    User appuser
    ProxyJump bastion
    IdentityFile ~/.ssh/appuser
```

Таким образом, подключиться к someinternalhost теперь можно при помощи
```sh
$ ssh someinternalhost
```

Данные для подключения:
bastion_IP = 158.160.35.233
someinternalhost_IP = 10.128.0.19

## Дз "Деплой тестового приложения"
Данные для подключения:
testapp_IP = 51.250.75.115
testapp_port = 9292

Команда для запуска Startup скрипта:
```sh
 $ sh ./startup.sh
 ```

## ДЗ "Сборка образов VM при помощи Packer"
- Параметризация шаблона
- Построение bake-образа --> по шаблону immutable.json в директории packer
- Создан скрипт create-reddit-vm.sh в директории config-scripts, который создает ВМ с помощью Yandex.Cloud CLI.
