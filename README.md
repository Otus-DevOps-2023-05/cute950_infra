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

## ДЗ "Сборка образов VM при помощи Packer"
- Параметризация шаблона
- Построение bake-образа --> по шаблону immutable.json в директории packer
- Создан скрипт create-reddit-vm.sh в директории config-scripts, который создает ВМ с помощью Yandex.Cloud CLI.

## Дз "Деплой тестового приложения"
Данные для подключения:
testapp_IP = 51.250.75.115
testapp_port = 9292

Команда для запуска Startup скрипта:
```sh
 $ sh ./startup.sh
 ```

### ДЗ "Практика IaC с использованием Terraform"
при команде terraform apply возникла ошибка:
Error: Error while requesting API to create instance: server-request-id = 76bc9c1a-7e5f-b439-b97e-d497fe004f4b server-trace-id = b01c8f65b967fb64:ca4dd494e5960766:b01c8f65b967fb64:1 client-request-id = 89def97d-5027-43c9-b77d-9b96e0ee3ef6 client-trace-id = 70fba088-4a74-4cb0-9ab7-47d78b9fb330 rpc error: code = InvalidArgument desc = the specified number of cores is not available on platform "standard-v1"; allowed core number: 2, 4, 6, 8, 10, 12, 14, 16, 20, 24, 28, 32

поправила ее путем изменения кол-ва ядер cores  = 2 в resources в main.tf

name так же изменила на reddit-app-terraform, так как в рамках предыдущего дз ВМ с именем reddit-app уже существовала

Выполнено:
Самостоятельные задания:
- Определите input переменную для приватного ключа,
использующегося в определении подключения для провижинеров (connection);
- Определите input переменную для задания зоны в ресурсе
"yandex_compute_instance" "app". У нее должно быть значение по умолчанию;
- Отформатируйте все конфигурационные файлы используя команду terraform fmt;
- Так как в репозиторий не попадет ваш terraform.tfvars, то нужно сделать рядом файл terraform.tfvars.example, в
котором будут указаны переменные для образца

Задание с **
- Создайте файл lb.tf и опишите в нем в коде terraform создание HTTP балансировщика
- Создание инстансов с заданием их количества через параметр ресурса count

### ДЗ "Принципы организации инфраструктурного кода и работа над инфраструктурой в команде на примере Terraform."
Выполнено:
Самостоятельные задания:
- Удалите из папки terraform файлы main.tf, outputs.tf, terraform.tfvars, variables.tf, так как они теперь перенесены в stage и prod
- Параметризируйте конфигурацию модулей насколько считаете нужным
- Отформатируйте конфигурационные файлы, используя команду terraform fmt

Задание с *
- Настройте хранение стейт файла в удаленном бекенде (remote backends) для окружений stage и prod, используя Yandex Object Storage в качестве бекенда. Описание бекенда нужно вынести в отдельный файл backend.tf
- Перенесите конфигурационные файлы Terraform в другую директорию (вне репозитория). Проверьте, что state-файл (terraform.tfstate) отсутствует. Запустите Terraform в обеих директориях и проконтролируйте, что он "видит" текущее состояние независимо от директории, в которой запускается
- Попробуйте запустить применение конфигурации одновременно, чтобы проверить работу блокировок

Задание с **
- Добавлены необходимые provisioner в модули для деплоя и работы приложения.
