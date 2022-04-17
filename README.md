# Домашнее задание к занятию "08.01 Введение в Ansible"

## Подготовка к выполнению
1. Установите ansible версии 2.10 или выше.
2. Создайте свой собственный публичный репозиторий на github с произвольным именем.
3. Скачайте [playbook](../../Ansible_1lesson/playbook/) из репозитория с домашним заданием и перенесите его в свой репозиторий.

## Основная часть
1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте какое значение имеет факт `some_fact` для указанного хоста при выполнении playbook'a.  
``````   
"msg": 12

``````

2. Найдите файл с переменными (group_vars) в котором задаётся найденное в первом пункте значение и поменяйте его на 'all default fact'.  
   
````
ok: [localhost] => {
    "msg": "all default fact"
}

````
3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.  
4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.  
````
ok: [centos7] => {
    "msg": "el"
}
ok: [ubuntu] => {
    "msg": "deb"
}
````
 

5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились следующие значения: для `deb` - 'deb default fact', для `el` - 'el default fact'.  
   
````
ok: [centos7] => {
    "msg": "el default fact"
}
ok: [ubuntu] => {
    "msg": "deb default fact"
}


````

6.  Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.  
    
````
ok: [centos7] => {
    "msg": "el default fact"
}
ok: [ubuntu] => {
    "msg": "deb default fact"
}



````

7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.  
````   
el default fact
!vault |
          $ANSIBLE_VAULT;1.1;AES256
          35303631333930356265353261653934366231306633633361383235663239353037306135323363
          3337356639663230303031613132326565316236616131650a666662653330656230666633323331
          30386330643863353964643137383538626465303261383935626666323061643435356533653632
          3332333531393665340a333166373761333433373232303639363831383966383361656265656235
          3534
Encryption successful


deb default fact
!vault |
          $ANSIBLE_VAULT;1.1;AES256
          66393137613666643865633037346166316565633261333038386632363239613338396166346136
          3830313465653433313231643133333639643562363235380a666136616134666265643864643864
          39343536396533356432643332323236646635666539303731663866313864326439376361326430
          6430613035613634370a396332346234323335303564626662646663363937366535643038613230
          33303536666133623765366363303161613439306536353866336237386232316364
Encryption successful


````
8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.  
   
````
$ ansible-playbook site.yml -i inventory/prod.yml --ask-vault-pass
Vault password:

PLAY [Print os facts] ***************************************************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************************************************
[WARNING]: Platform linux on host centos7 is using the discovered Python interpreter at /usr/bin/python3.10, but future installation of another Python interpreter could change the
meaning of that path. See https://docs.ansible.com/ansible-core/2.12/reference_appendices/interpreter_discovery.html for more information.
ok: [centos7]
[WARNING]: Platform linux on host ubuntu is using the discovered Python interpreter at /usr/bin/python3.10, but future installation of another Python interpreter could change the
meaning of that path. See https://docs.ansible.com/ansible-core/2.12/reference_appendices/interpreter_discovery.html for more information.
ok: [ubuntu]

TASK [Print OS] *********************************************************************************************************************************************************************
ok: [centos7] => {
    "msg": "Kali"
}
ok: [ubuntu] => {
    "msg": "Kali"
}

TASK [Print fact] *******************************************************************************************************************************************************************
ok: [centos7] => {
    "msg": "el default fact"
}
ok: [ubuntu] => {
    "msg": "deb default fact"
}

PLAY RECAP **************************************************************************************************************************************************************************
centos7                    : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
ubuntu                     : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

````  


9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.  
   
````
local                          execute on controller

````

10. В `prod.yml` добавьте новую группу хостов с именем  `local`, в ней разместите localhost с необходимым типом подключения.  
    
````
ok: [centos7] => {
    "msg": "el default fact"
}
ok: [localhost] => {
    "msg": "all default fact"
}
ok: [ubuntu] => {
    "msg": "deb default fact"
}

PLAY RECAP **************************************************************************************************************************************************************************
centos7                    : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
localhost                  : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
ubuntu                     : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0


````

11. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь что факты `some_fact` для каждого из хостов определены из верных `group_vars`.  
    
````
TASK [Print fact] *******************************************************************************************************************************************************************
ok: [centos7] => {
    "msg": "el default fact"
}
ok: [localhost] => {
    "msg": "all default fact"
}
ok: [ubuntu] => {
    "msg": "deb default fact"
}

````
12. Заполните `README.md` ответами на вопросы. Сделайте `git push` в ветку `master`. В ответе отправьте ссылку на ваш открытый репозиторий с изменённым `playbook` и заполненным `README.md`.  

`````
https://github.com/skYth1an/Ansible_1lesson.git

`````

## Необязательная часть

1. При помощи `ansible-vault` расшифруйте все зашифрованные файлы с переменными.  

````   
┌──(kali㉿kali)-[/usr/ansible-homework/playbook]
└─$ ansible-vault decrypt
Vault password:
Reading ciphertext input from stdin
$ANSIBLE_VAULT;1.1;AES256
66393137613666643865633037346166316565633261333038386632363239613338396166346136
3830313465653433313231643133333639643562363235380a666136616134666265643864643864
39343536396533356432643332323236646635666539303731663866313864326439376361326430
6430613035613634370a396332346234323335303564626662646663363937366535643038613230
33303536666133623765366363303161613439306536353866336237386232316364
Decryption successful
deb default fact                                                                                                                                                                     
┌──(kali㉿kali)-[/usr/ansible-homework/playbook]
└─$ ansible-vault decrypt
Vault password:
Reading ciphertext input from stdin
$ANSIBLE_VAULT;1.1;AES256
35303631333930356265353261653934366231306633633361383235663239353037306135323363
3337356639663230303031613132326565316236616131650a666662653330656230666633323331
30386330643863353964643137383538626465303261383935626666323061643435356533653632
3332333531393665340a333166373761333433373232303639363831383966383361656265656235
3534
Decryption successful
el default fact               
````

2. Зашифруйте отдельное значение `PaSSw0rd` для переменной `some_fact` паролем `netology`. Добавьте полученное значение в `group_vars/all/exmp.yml`.  

``````   
└─$ ansible-vault encrypt_string
New Vault password:
Confirm New Vault password:
Reading plaintext input from stdin. (ctrl-d to end input, twice if your content does not already have a newline)
PaSSw0rd
!vault |
          $ANSIBLE_VAULT;1.1;AES256
          39373838353563336237373238343633393630323463353435373132346132613834333537646335
          3637303036383563653931616131633933343564626561310a613266346635336266623064306633
          65616231333962383066666561336239626539363063323662633537326264393934303264303234
          3562363361323538370a343964316565343462333563366362633365363632363436326634626636
          6533
Encryption successful

``````

3. Запустите `playbook`, убедитесь, что для нужных хостов применился новый `fact`.  

````
ok: [ubuntu] => {
    "msg": "deb default fact"
}
ok: [centos7] => {
    "msg": "el default fact"
}
ok: [localhost] => {
    "msg": "PaSSw0rd"
}

````
4. Добавьте новую группу хостов `fedora`, самостоятельно придумайте для неё переменную. В качестве образа можно использовать [этот](https://hub.docker.com/r/pycontribs/fedora).  
   
````
ok: [ubuntu] => {
    "msg": "deb default fact"
}
ok: [centos7] => {
    "msg": "el default fact"
}
ok: [localhost] => {
    "msg": "PaSSw0rd"
}
ok: [fedor] => {
    "msg": "some_var"
}


````
5. Напишите скрипт на bash: автоматизируйте поднятие необходимых контейнеров, запуск ansible-playbook и остановку контейнеров.  
   
````
CSTATE=$(docker ps -qa)
if [ -z "$CSTATE" ]
then cd /usr/ansible-homework/playbook ;\
 docker run --name fedor -d pycontribs/fedora:latest sleep 6000000000 ; \
 sleep 5 ; \
 docker stop $(docker ps -qa) ; \
 docker rm $(docker ps -qa)
else docker stop $(docker ps -qa) ; docker rm $(docker ps -qa)
fi

````
6. Все изменения должны быть зафиксированы и отправлены в вашей личный репозиторий.

---

### Как оформить ДЗ?

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---
