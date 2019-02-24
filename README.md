# DragonPass
A Web App to Generate Secure, Easy to Memorize Passwords for Temporary Employee Passwords or for Children, written in Racket and Scheme

### Motivation for this Project
I've been working on a little program in Racket that creates an easy to remember, friendly sounding password, similar to DinoPass, but that would be more secure. It takes a few lists containing several lists of cheerful sounding words, and concatenates words from those list into a string, and then replaces letters with symbolic characters. (e.g. replaces "a" with "@", "i" with "1", and so on...) When I learned about Racket's web server capabilities, I thought it would be fun to do this as a 100% Scheme/Racket web app.

This would be also have a practical use for me, as it would be something I would actually use.

Now that most businesses are moving to 2 factor authentication and password management software for employee passwords, a service like this may not seem to be as useful as it once would have been, but is still needed for temporary passwords for manual password resets, and would benefit families and small businesses in particular. Even if you use a password manager for everything, this app could help you pick a good, secure master password that you can easily remember without having to write down and possibly misplace.

Setup for Ubuntu 18.10 Cosmic:

1. Install Docker and Racket image on Ubuntu
   as of 2/22/2019 instructions on Docker website are not correct, 18.10 no longer works with the build they have listed)

    ```
    sudo snap install docker
    docker pull jackfirth/racket
    ```

2.  Assemble everything together in skeleton within docker container 
3.  Just need one container to start, just to generate and refres
4.  Get friendly dictionary file.
5.  Change script to follow good password practices
6.  Spot check against Kaspersky site for complexity, average time to be cracked
8.  Insert cute dragon graphic
9.  Css styling
10. VPS or port forwarding for hosting docker container

### Status
Look, right now its a bit of a dumpster fire in here. Racket is really cute but there is a reason this isn't widely used for webdev. It is experimental only at this stage. I've uploaded the files and am working on getting something completed. 

This is meant to be an experiment to test out Racket as a web server. There is a webservelet library available, and a few very rudimentary frameworks based on this library. There is also a Docker container based on the library that I would like to test.
