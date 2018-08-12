<br><br><br><br><br>
<h1 align="center">
  <br>
  <a href="https://github.com/NicolasVanBossuyt/core-one"><img src="https://github.com/NicolasVanBossuyt/core-one/raw/master/doc/logo.png?raw=true" alt="core one" width="512"></a>
  <br>
  skift<b>OS</b>
  <br>
</h1>

<h4 align="center">A hobby <i>operating system</i> build from scratch</h4>

<p align="center">
  <img src="https://img.shields.io/github/issues/NicolasVanBossuyt/core-one.svg?style=for-the-badge"> <img src="https://img.shields.io/github/license/NicolasVanBossuyt/core-one.svg?style=for-the-badge"> <img src="https://img.shields.io/github/stars/NicolasVanBossuyt/core-one.svg?style=for-the-badge">
</p>

<br><br><br><br><br>

## Features
 - Boot with grub
 - Preemptive multitasking

## Screenshots
![logo](doc/capture.png)

## Roadmap
### ♥ Milestone 0 - a basic kernel
 - [X] IDT, GDT, IRQ and ISR
 - [ ] Pagging (WIP)
 - [ ] Memory managment (WIP)
 - [X] Tasking

### 📂 Milestone 1 - File system
 - [X] ATA pio driver
 - [X] RAM disk
 - [ ] Virtual file system (WIP)
 
### 👦 Milestone 2 - User mode
 - [ ] Jump to user mode
 - [ ] ELF loader
 - [ ] hellowolrd.c

### 🤙 Milestoone 3 - System calls
 - [ ] SYSCALLS (printf, open, close, read, write, ioctl, exec, fork, wait, exit)

### 🐚 Milestone 3 - shell
 - [ ] Basic shell
 - [ ] coreutils (ls, cat, ...)

### 👽 Milestone 4 - What next?
 - GUI?
 - Porting sortware?
 - Real hardware?
 - Networking?
 - ???

## Build the operating system
 1. First you need to build the toolchain using: `make toolchain`
 2. Then build the system using: `make`
 3. Finaly you can run it using: `make run`

## License
This project is licensed under the MIT License - see the LICENSE.md for details.
