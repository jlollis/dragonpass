# dragonpass
A Web App to Generate Secure, Easy to Memorize Passwords for Temporary Employee Passwords or for Children, written in Racket and Scheme

This is meant to be an experiment to test out Racket as a web server. There is a webservelet library available, and a few very rudimentary frameworks based on this library. There is also a Docker container based on the library that I would like to test. 

I thought it would be fun to do a 100% Scheme/Racket web app. I was working on a little program that creates an easy to remember, friendly sounding password, similar to DinoPass, but that would be more secure. It takes a few lists containing several lists of cheerful sounding words, and concatenates words from those list into a string, and then replaces letters with symbolic characters. (e.g. replaces "a" with "@", "i" with "1", and so on...) 

This would be something I would actually use to create temp passwords for password resets, since security is less important than ease of use in this situation. At the same time, you don't want it to be super easy to crack, since you might be handing it off to L1 support to assist with. Or, if the user never actually changes the temp password, at least it is somewhat secure.

Now that most businesses are moving to 2 factor authentication and password management software for employee passwords, this won't be as important as it once was, but it is needed for temp passwords and for kids or people who may not want to use a password manager for certain accounts. Also, the password manager needs a master password, and this app could help with that, so that you can remember it without having to write it down and possibly misplace it. It could also benefit small businesses.



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

## Status
Look, right now its a bit of a dumpster fire in here. Racket is really cute but there is a reason this isn't widely used for webdev. It is experimental only at this stage. I've uploaded the files and am working on getting something completed. 
