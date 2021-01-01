# Proyek-Akhir-Sysprog


## Table of contents
* [Project] (#project)
* [Script](#script)
* [Configuration](#configuration)
* [.bashrc] (#bash)
* [Setup](#setup)

<a name="project"></a>
## Project
Pada proyek ini, kami merancang sebuah aplikasi CLI (Command Line Interface) yang bertujuan untuk mengetahui USB device apa saja yang sedang terhubung dengan komputer yang sedang digunakan. Selain itu, aplikasi kami ini dapat melakukan bind dan unbind USB device sesuai dengan keinginan pengguna. Bind di sini berarti menghubungkan USB pada perangkat sedangkan unbind berarti melepaskan hubungan USB dengan perangkat. 

<a name="script"></a>
## Script
Script drv_USB.sh otomatis dijalankan pada saat user sudah login.

<a name="configuration"></a>
## Configuration
File config di sini merupakan hasil konfigurasi custom kernel yang telah kami lakukan.

<a name="bash"></a>
## .bash
File .bashrc ini kami tambahkan command agar script dapat berjalan secara otomatis jika user sudah login.

<a name="setup"></a>
## Setup
Untuk menjalankan proyek ini, user di minta untuk memasukan sebuah input,

```
=================================
Hello, what do you want to do?
=================================
1. View binded USB devices
2. Bind a USB device
3. Unbind a USB device
4. Exit

$ Input: 
```
