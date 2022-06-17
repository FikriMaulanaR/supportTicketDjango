# supportTicketDjango

Copyright 2022 Fikri Maulana Rachman and PT. Terrindo Bumi Raya. All Rights Reserved. See LICENSE for details.

Django Support Ticket merupakan sebuah forum tanya jawab antar user dengan admin support dengan tujuan mencari solusi dari masalah - masalah yang ada.

# Instalasi

Support Ticket Django requires:
* Python 3.9.13 or more
* Django 3.2.13 or more
* Psycopg2
* PostgreSQL 12

Unduh repository ke dalam komputer menggunakan perintah `git clone`. Url
repository dapat dilihat di dalam repository yang diinginkan.
```
git clone <url repository> <folder tujuan>
git clone https://github.com/FikriMaulanaR/supportTicketDjango.git SupportTicket
Cloning into 'SupportTicket'...
remote: Counting objects: 4, done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 4 (delta 0), reused 4 (delta 0), pack-reused 0
Unpacking objects: 100% (4/4), done.
```

# Demo
Setelah berhasil mengunduh repository, instalasi terlebih dahulu virtualenvironment.
```
python3 -m virutalenv Env
```
Kemudian install pip dengan perintah berikut.
```
sudo apt install python-pip3
```
langsung demo sistem dengan perintah:
 ```
 python manage.py runserver / python3 manage.py runserver
 ```
 Gunakan akun demo:
 ```
 Username : adminsupport
 Password : admin123
 ```
 # LICENSE
 supportTicketDjango is licensed under terms of the MIT license. See the LICENSE file for full licensing terms.
 
