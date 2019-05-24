#lang racket
(require web-server/servlet
         web-server/servlet-env
         web-server/templates
         web-server/formlets/input
         web-server/http/xexpr)

(define (my-app req)
  (response/xexpr
   `(html (head (title "Hello world!"))
          (body (p "Hey out there!")))))

(serve/servlet my-app
               #:launch-browser? #f
               #:port 8080
               #:listen-ip #f
               #:servlet-path "/index.rkt"
               #:extra-files-paths
               ;(list
               ;  (build-path "/var/www")))
               (list
                 (build-path "/Users/Julie/Desktop/dragonpass/myapp"))
               )

;(let ([thing "Templates"])
;  (include-template "simple.html"))


;(define (fast-template thing)
;  (include-template "simple.html"))
 
;(fast-template "Templates")
;(fast-template "Noodles")

