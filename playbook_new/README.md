#### Описание ролей

#### Vector
1. Данная роль содержит набор tasks для установки vector, котоыре включают в себя скачание/распаковку ПО,копирование конфигов, настройку systemd для запуска
2. Конфиги хранятся в каталоге templates
3. Переменные по умолчанию определены в каталоге default
4. Переменные которые переопределяют default в каталоге vars  


#### Ligthouse  

1. Данная роль содержит в себе только 1 task с клонированием репозитария с Ligthouse, в котором дополнительно определен перезапуск Nginx через handler
2. Handler для перезапуска nginx определен в каталоге handlers
3. Переменные по умолчанию определены в каталоге default
4. Переменные которые переопределяют default в каталоге vars    

#### Скриншоты установки с помощью ролей

![1](https://github.com/skYth1an/Ansible_1lesson/blob/0592a81564da3f7387d8b5c078a81651e9499df6/images/1.PNG "1")
![2](https://github.com/skYth1an/Ansible_1lesson/blob/0592a81564da3f7387d8b5c078a81651e9499df6/images/2.PNG "2")
![3](https://github.com/skYth1an/Ansible_1lesson/blob/0592a81564da3f7387d8b5c078a81651e9499df6/images/3.PNG "3")