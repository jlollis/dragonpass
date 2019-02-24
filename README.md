# dragonpass
A Web App to Generate Secure, Easy to Memorize Passwords for Temporary Employee Passwords or for Children, written in Racket and Scheme

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
6.  Spot check against Kaspersky site for complexity
7.  Check against have I been pwned to see if thDocker containerat password is on any lists (not sure why it would matter)
8.  Insert pic
9.  Css styling
10. VPS or port forwarding

## Status
Look, right now its a bit of a dumpster fire in here. Racket is really cute but there is a reason this isn't widely used for webdev. It is experimental only at this stage. I've uploaded the files and am working on getting something completed. 
