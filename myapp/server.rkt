#lang racket/base

(require (prefix-in dispatch: web-server/dispatch)
         (prefix-in dispatch-log: web-server/dispatchers/dispatch-log)
         (prefix-in xexpr: web-server/http/xexpr)
         (prefix-in servlet: web-server/servlet-env))

(require (racket/format css-expr)
(~a
   (substring
    (css-expr->css
     (css-expr
      ; Styles from http://bettermotherfuckingwebsite.com/
      [body
       #:margin (40px auto)
       #:max-width 650px
       #:line-height 1.6
       #:font-size 18px
       #:color |#444|
       #:padding (0 10px)]
      [h1 h2 h3
       #:line-height 1.2])))))


(define (not-found-route request)
  (xexpr:response/xexpr
   `(html (body (h2 "Uh-oh! Page not found.")))))

(define (home-route request)
  (xexpr:response/xexpr
   `(html (body (h2 "Hello out there. ;) ")))))

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

;http://notes.eatonphil.com/walking-through-a-basic-racket-web-service.html