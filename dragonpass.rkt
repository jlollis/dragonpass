#lang racket/base

(require (prefix-in dispatch: web-server/dispatch)
         (prefix-in dispatch-log: web-server/dispatchers/dispatch-log)
         (prefix-in xexpr: web-server/http/xexpr)
         (prefix-in servlet: web-server/servlet-env))

(define (pick-one l)
  (list-ref l (random (length l))))

(define (word1)
   (pick-one '("abroad"
           "ague"
           "cordwainer"
           "degrade"
           "demense"
           "delate")))

(define (word2)
  (pick-one '("animals"
          "blushing"
          "cats"
          "insects"
          "idleness")))

(define (word3)
   (pick-one '("afreet"
          "amphibiology"
          "merkin"
          "mimsy"
          "nagware"
          "nugacity"
          "burnsides")))

(define (word4)
  (pick-one '("breatharian"
          "calligyptian"
          "couthy"
          "effable"
          "emacrity"
          "hongi"
          "illywacker"
          "guddle"
          "hwyl"
          "haruspex")))

;(display (password))

(define (password)
  (string-append (word1)
                 " "
                 (word2)
                 " "
                 (word3)
                 " "
                 (word4)))

(define (not-found-route request)
  (xexpr:response/xexpr
   `(html (body (h2 "Uh-oh! Page not found.")))))

(define (home-route request)
  (xexpr:response/xexpr
   `(html
     '(style
         ((type "text/css"))
             "body { background-color: #ACAEFB;
                     text-align: center;
                     font-family: Arial, Helvetica, sans-serif; }"
             "h1 { color: white; padding-top: 5rem; font-size: 50px;}"
             "h2 { color: white; padding-top: .25rem;
                   font-style: italic; font-size: 18px;}"
             "p { color: white; padding-top: 1rem;
                  padding-bottom: 25rem;
                  font-size: 45px;}"
             "footer { postition: absolute; bottom: 0; width:100%; color: white; }")
          (body
            (h1 "🐉 DragonPass")
            (h2 "(A Simple Password Generator, Written in Racket)")
            (p, (password)
            (footer "Julie Lollis, 2019 | Hosted on Linode"))))))

(define-values (route-dispatch route-url)
  (dispatch:dispatch-rules
   [("") home-route]
   [else not-found-route]))

(define (route-dispatch/log-middleware req)
  (display (dispatch-log:apache-default-format req))
  (flush-output)
  (route-dispatch req))

(servlet:serve/servlet
 route-dispatch/log-middleware
 #:servlet-path "/"
 #:servlet-regexp #rx""
 #:stateless? #t
 #:port 80
 #:launch-browser? #f
 #:listen-ip #f)