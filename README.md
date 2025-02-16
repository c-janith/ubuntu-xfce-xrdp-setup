# Ubuntu XFCE + XRDP Setup Script

This project provides a **bash script** to automate the installation of a lightweight desktop environment (**XFCE**), remote desktop access (**XRDP**), and essential applications (**Firefox** and **Transmission**) on an **Ubuntu VPS**. It also creates a new user with a username and password of your choice and displays the login details at the end of the installation.

---

## **Purpose**
The purpose of this project is to simplify the process of setting up a **remote desktop environment** on an Ubuntu VPS. This is particularly useful for:
- Users who want a graphical interface on their VPS.
- Developers who need a lightweight desktop environment for remote work.
- Anyone who wants to run GUI-based applications (e.g., Firefox, Transmission) on a headless server.

---

## **Features**
- Installs **XFCE** (a lightweight desktop environment).
- Configures **XRDP** for remote desktop access.
- Installs **Firefox** (web browser) and **Transmission** (BitTorrent client).
- Creates a **new user** with a username and password of your choice.
- Displays **login details** (IP, username, and password) at the end of the installation.

---

## **Requirements**
- An **Ubuntu VPS** (tested on Ubuntu 20.04 and 22.04).
- SSH access to the VPS.
- Basic knowledge of Linux commands.

---

## **Installation Methods**

### **Method 1: Using the Script Directly**
1. SSH into your VPS:
   ```bash
   ssh user@your-vps-ip
