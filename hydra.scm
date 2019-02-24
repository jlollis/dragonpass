#lang racket

(require web-server/servlet
         web-server/servlet-env)

(require net/uri-codec)

(define (form-servlet req)
  
  (define uri (request-uri req))
  (define path (map path/param-path (url-path uri)))    
  (define page (car path))
  
  (cond 
    
    ; /form
    [(equal? page "form")
     (response/xexpr
      `(html
        (body
         (form ([method "POST"] [action "/print-form-data"])
               "user name: " (input ([type "text"] [name "user"]))
               (br)
               "comment: " (input ([type "text"] [name "comment"]))
               (br)
               (input ([type "submit"]))))))]
    
    ; /print-form-data
    [(equal? page "print-form-data")
  
     ; extract the form data:
     (define post-data (bytes->string/utf-8 (request-post-data/raw req)))
     
     ; convert to an alist:
     (define form-data (form-urlencoded->alist post-data))

     ; pull out the user and comment:
     (define name    (cdr (assq 'user form-data)))
     (define comment (cdr (assq 'comment form-data)))
     
     ; send back the extracted data:
     (response/xexpr
      `(html
        (body
         (p "Your name: " ,name)
         (p "You comment: " ,comment))))]
    
    ; another page?
    [else
     (response/xexpr
      `(html
        (body
         (p "Page not found!"))))]))
         
(serve/servlet form-servlet
               #:servlet-regexp #rx""
               #:servlet-path "/form")


;works in Chicken, Racket, SISC
;Read a file to a list of chars
(define (file->char_list path)
 (call-with-input-file path
   (lambda (input-port)
     (let loop ((x (read-char input-port)))
       (cond 
        ((eof-object? x) '())
        (#t (begin (cons x (loop (read-char input-port))))))))))