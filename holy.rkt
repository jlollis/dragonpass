#lang racket
(require HoLy)

(http/get "/"
    (λ (req) "Welcome"))

(http/get "/article/:id"
    (λ (req)
	(let* ((id (request/param 'id)))
	    (string-append "This is article #" id))))

(server/set-port 8080)

(server/run)