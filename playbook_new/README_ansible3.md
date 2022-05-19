### Установка Lighthouse

1. Предварительно создаем handler для запуска сервиса nginx  
2. Пакетным менеджером с помощью модуля yum устанавливаем необходимое ПО - nginx,git  
3. C помощью модуля template переносим конфиг nginx на сервер
4. С помощью модуля git клонируем репозиторий с Lighthouse  
5. Делаем рестарт nginx при помощи ранее созданного handler  
6. Дополнительно на этот сервер устанавливаем vector, для сбора логов   

##### Скриншоты  


![1](https://github.com/skYth1an/Ansible_1lesson/blob/4f5d8e4ab40e76277770e2c19a90cf8c48da0acd/images/1.PNG "1")
![2](https://github.com/skYth1an/Ansible_1lesson/blob/4f5d8e4ab40e76277770e2c19a90cf8c48da0acd/images/2.PNG "2")
![3](https://github.com/skYth1an/Ansible_1lesson/blob/4f5d8e4ab40e76277770e2c19a90cf8c48da0acd/images/3.PNG "3")