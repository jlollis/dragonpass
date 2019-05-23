#lang racket

(define descriptors '(zenith worthy wonder wisdom vivid warmer virtue victory useful uplift valiant valor vibrant twinkly sweet tender talent swift think steady strong secure scenic sharp prowess pure protect proven enrich enjoy appeal amaze attune approve beloved beauty awesome beckon believe catchy capable comfy clear clean concise dignity edify elate elevate encourage empathy fancy faith fair finest glory grace good gumption halcyon heaven hearten healthy illuminate idyllic impress improve ingenious ingenuity invincible jubilant joyful jolly jovial judicious wisely))

(define animals '(gator ant bear bee bird camel cat cheetah deer dragon dolphin duck eagle elephant fish fox frog giraffe rainbowfish horse kangaroo kitty lion llama monkey octopus owl panda puppy rabbit seal shark sheep snail snake spider squirrel tiger turtle wolf zebra))

(define colors '(red blue green orange yellow purple magenta cyan golden pink navy black white))

(define symbols '(! @ $ % ^ & * + -))

(define nth
  (lambda (n g)
    (if (= n 1)
        (car g)
        (nth (- n 1)(cdr g)))))

(define one-of
  (lambda (k)
    (nth (+ 1 (random (length k))) k)))

(define color
  (lambda ()
    (list (one-of colors))))

(define animal
  (lambda ()
    (list (one-of animals))))

(define descriptor
  (lambda ()
    (list (one-of descriptors))))

(define symbol
  (lambda ()
    (list (one-of symbols))))

(define symbol?
  (lambda ()
    (if (= (random 3) 0)
        '()
        (symbols))))

(define descriptor*
  (lambda ()
    (if (= (random 2) 0)
        '()
        (append (animal)(descriptor*)))))

(define letter-sub
  (lambda ()
    (append (descriptor*)(color))))

(define letter-sub?
  (lambda ()
    (if (= (random 2) 0)
        '()
        (append (descriptor*)(color)))))

(define password
  (lambda ()
    (append (letter-sub)(color)(letter-sub?))))
