#lang racket
(require racket/gui/base)


(define board1 (vector
                (vector 0 0 0 0)
                (vector 0 0 0 0)
                (vector 0 0 0 0)
                (vector 0 0 0 0)

                ))

(define board2 (vector
                (vector 0 0 0 0)
                (vector 0 0 0 0)
                (vector 0 0 0 0)
                (vector 0 0 0 0)

                ))

(define hitboard1 (vector
                   (vector 0 0 0 0)
                   (vector 0 0 0 0)
                   (vector 0 0 0 0)
                   (vector 0 0 0 0)

                   ))

(define hitboard2 (vector
                   (vector 0 0 0 0)
                   (vector 0 0 0 0)
                   (vector 0 0 0 0)
                   (vector 0 0 0 0)

                   ))

;hash table contain the respective x and y of each cell and the position in the matrix board.
(define PositionTable (hash

                       "A1" (vector 0 0 0 0)
                       "B1" (vector 94 78 0 1)
                       "C1" (vector 188 156 0 2) 
                       "D1" (vector 282 234 0 3) 
                       "A2" (vector 0 0 1 0)
                       "B2" (vector 94 78 1 1)
                       "C2" (vector 188 156 1 2) 
                       "D2" (vector 282 234 1 3) 
                       "A3" (vector 0 0 2 0)
                       "B3" (vector 94 78 2 1)
                       "C3" (vector 188 156 2 2) 
                       "D3" (vector 282 234 2 3) 
                       "A4" (vector 0 0 3 0)
                       "B4" (vector 94 78 3 1)
                       "C4" (vector 188 156 3 2) 
                       "D4" (vector 282 234 3 3) 
                    
               

               
                       ))

(define Pos (hash

             0 (vector 0 0 0 0)
             1 (vector 94 0 0 1)
             2 (vector 188 0 0 2) 
             3 (vector 282 0 0 3) 
             4 (vector 0 78 1 0)
             5 (vector 94 78 1 1)
             6 (vector 188 78 1 2) 
             7 (vector 282 78 1 3) 
             8 (vector 0 156 2 0)
             9 (vector 94 156 2 1)
             10 (vector 188 156 2 2) 
             11 (vector 282 156 2 3) 
             12 (vector 0 234 3 0)
             13 (vector 94 234 3 1)
             14 (vector 188 234 3 2) 
             15 (vector 282 234 3 3) 
                    
               

               
             ))



(define currentPlayer 1)
(define Cruiser 0)
(define Destroyer 0)
(define size 0)
(define x 0)
(define y 0)
(define start 0)
(define counter1 5)
(define counter2 5)


(define txt null)

;-------------------Functions-----------------------------------------------------------



(define CruiserPosition
  (lambda (x)
    (cond
      [(= currentPlayer 1)(cond
                            [(= x 1)(send textarea set-value "Player 1: \n - type a coordinate such as A1 or B4 and press enter to position the first part of your cruiser")]
                            [(= x 2)(send textarea set-value "Player 1: \n - type a coordinate such as A1 or B4 and press enter to position the second part of your cruiser")]
                            [(= x 3)(send textarea set-value "Player 1: \n - type a coordinate such as A1 or B4 and press enter to position the third part of your cruiser")]
                            )]

      [(= currentPlayer 2)(cond
                            [(= x 1)(send textarea set-value "Player 2: \n - type a coordinate such as A1 or B4 and press enter to position the first part of your cruiser")]
                            [(= x 2)(send textarea set-value "Player 2: \n - type a coordinate such as A1 or B4 and press enter to position the second part of your cruiser")]
                            [(= x 3)(send textarea set-value "Player 2: \n - type a coordinate such as A1 or B4 and press enter to position the third part of your cruiser")]                               
                                    
                            )]
      )))


(define DestroyerPosition
  (lambda (x)
    (cond
      [(= currentPlayer 1)(cond
                            [(= x 1)(send textarea set-value "Player 1: \n - type a coordinate such as A1 or B4 and press enter to position the first part of your destroyer")]
                            [(= x 2)(send textarea set-value "Player 1: \n - type a coordinate such as A1 or B4 and press enter to position the second part of your destroyer")]
                              
                            )]
      [(= currentPlayer 2)(cond
                            [(= x 1)(send textarea set-value "Player 2: \n - type a coordinate such as A1 or B4 and press enter to position the first part of your destroyer")]
                            [(= x 2)(send textarea set-value "Player 2: \n - type a coordinate such as A1 or B4 and press enter to position the second part of your destroyer")]                         
                            )])))


                                      

                                      

(define ErrorMessage
  (lambda (x)
    (cond
      [(= currentPlayer 1)(cond
                            [(= x 1)(send textarea set-value "Inserted value is incorrect \n Player 1: \n - type a coordinate such as A1 or B4 and press enter to position your cruiser")]
                            [(= x 2)(send textarea set-value "Inserted value is incorrect \n Player 1: \n - type a coordinate such as A1 or B4 and press enter to position your destroyer")]
                            )]
      
      [(= currentPlayer 2)(cond
                            [(= x 1)(send textarea set-value "Inserted value is incorrect \n Player 2: \n - type a coordinate such as A1 or B4 and press enter to position your cruiser")]
                            [(= x 2)(send textarea set-value "Inserted value is incorrect \n Player 2: \n - type a coordinate such as A1 or B4 and press enter to position your destroyer")]
                            )]
      )))

(define read (lambda ()
               (set! txt (send textfield get-value))
               )
  )

(define shootRocket
  (lambda (x)
    (cond
      [(= currentPlayer 1)(cond
                            [(= x 1)(send textarea set-value "Player 1: \n - type a coordinate such as A1 or B4 and press enter to shoot a rocket")]
                            [(= x 2)(send textarea set-value "Player 1: \n - great you hit a target \n- type a coordinate such as A1 or B4 and press enter to shoot another rocket")]
                            )]
      [(= currentPlayer 2)(cond
                            [(= x 1)(send textarea set-value "Player 2: \n - type a coordinate such as A1 or B4 and press enter to shoot a rocket")]
                            [(= x 2)(send textarea set-value "Player 2: \n - great you hit a target \n- type a coordinate such as A1 or B4 and press enter to shoot another rocket")]
                            )]
      )))


(define checkCounter
  (lambda ()
    (cond
      [(= counter1 0)(send textarea set-value "Player 1 Wins")(send insertButton enable #f)] ;(send myFrame show #f) (send startFrame show #t)]
      [(= counter2 0)(send textarea set-value "Player 2 Wins")(send insertButton enable #f)];(send myFrame show #f) (send startFrame show #t)]
      )))


(define draw (lambda ()
               (send can1 refresh-now)
               (send can1 on-paint)
               (send can2 refresh-now)
               (send can2 on-paint)
               (define dc1 (send can1 get-dc))
               (define dc2 (send can2 get-dc))
               (define blue (new pen% [color "blue"] [width 2]))
               (define brush_blue (new brush% [color "blue"]))
               (define red (new pen% [color "red"] [width 2]))
               (define brush_red(new brush% [color "red"]))
               (define black (new pen% [color "black"] [width 2]))
               (define brush_black(new brush% [color "black"]))

               (cond
                 [(= currentPlayer 1)
                  (for([i 16])     ;(println(vector-ref (vector-ref board1 (vector-ref (hash-ref Pos i) 3)) (vector-ref (hash-ref Pos i) 2)))
                    (cond
                      [(not(equal? (vector-ref (vector-ref board1 (vector-ref (hash-ref Pos i) 3)) (vector-ref (hash-ref Pos i) 2)) 0))
                       (send dc1 set-brush brush_blue)
                       (send dc1 set-pen blue)
                       (send dc1 draw-rounded-rectangle (+(vector-ref (hash-ref Pos i) 0) 22) (+(vector-ref (hash-ref Pos i) 1) 15)  50 50 -0.25)
                       ]
                      )
                    (cond
                      [(equal? (vector-ref (vector-ref hitboard1 (vector-ref (hash-ref Pos i) 3)) (vector-ref (hash-ref Pos i) 2)) "H")                          
                       (send dc2 set-brush brush_red)                                           
                       (send dc2 set-pen red)                               
                       (send dc2 draw-rounded-rectangle (+(vector-ref (hash-ref Pos i) 0) 22) (+(vector-ref (hash-ref Pos i) 1) 15)  50 50 -0.25)]
                      
                      [(equal? (vector-ref (vector-ref hitboard1 (vector-ref (hash-ref Pos i) 3)) (vector-ref (hash-ref Pos i) 2)) "M")                           
                       (send dc2 set-brush brush_black)                                           
                       (send dc2 set-pen black)                               
                       (send dc2 draw-rounded-rectangle (+(vector-ref (hash-ref Pos i) 0) 22) (+(vector-ref (hash-ref Pos i) 1) 15)  50 50 -0.25)]
                      )
                    )
                  ]
                 [(= currentPlayer 2)
                  (for([j 16])                                       
                    (cond
                      [(not(equal? (vector-ref (vector-ref board2 (vector-ref (hash-ref Pos j) 3)) (vector-ref (hash-ref Pos j) 2)) 0))                
                       (send dc2 set-brush brush_red)                                          
                       (send dc2 set-pen red)
                       (send dc2 draw-rounded-rectangle (+(vector-ref (hash-ref Pos j) 0) 22) (+(vector-ref (hash-ref Pos j) 1) 15)  50 50 -0.25)]
                      )
                    (cond
                      [(equal? (vector-ref (vector-ref hitboard2 (vector-ref (hash-ref Pos j) 3)) (vector-ref (hash-ref Pos j) 2)) "H")
                       (send dc1 set-brush brush_blue)                                          
                       (send dc1 set-pen blue)                                
                       (send dc1 draw-rounded-rectangle (+(vector-ref (hash-ref Pos j) 0) 22) (+(vector-ref (hash-ref Pos j) 1) 15)  50 50 -0.25)]
                      
                      [(equal? (vector-ref (vector-ref hitboard2 (vector-ref (hash-ref Pos j) 3)) (vector-ref (hash-ref Pos j) 2)) "M")                           
                       (send dc1 set-brush brush_black)                                           
                       (send dc1 set-pen black)                               
                       (send dc1 draw-rounded-rectangle (+(vector-ref (hash-ref Pos j) 0) 22) (+(vector-ref (hash-ref Pos j) 1) 15)  50 50 -0.25)]
                      )
                    )]            
                 )
               )
  )






(define insertShip
  (lambda ()
    (cond
      [(= start 0)   
       (cond
         [(= currentPlayer 1)
          (cond
            [(= Cruiser 0)
             (cond
               [(= size 0)
                (cond
                  [(regexp-match #rx"(A1|B1|C1|D1|A2|B2|C2|D2|A3|B3|C3|D3|A4|B4|C4|D4)" (string-upcase txt))
                   (cond
                     [(equal? (vector-ref (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3))(vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                      (vector-set!
                       (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3))
                       (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "C")
                      (set! size 1)(CruiserPosition 2)(draw)]
                     )]

                  (ErrorMessage 1)
                  )]
               
               [(= size 1)
                (cond
                  [(regexp-match #rx"(A1|B1|C1|D1|A2|B2|C2|D2|A3|B3|C3|D3|A4|B4|C4|D4)" (string-upcase txt))
                   (set! y (vector-ref (hash-ref PositionTable (string-upcase txt)) 2))
                   (set! x (vector-ref (hash-ref PositionTable (string-upcase txt)) 3))

                   (if(>= (- x 1) 0)
                      (cond
                        [(equal? (vector-ref (vector-ref board1 (- x 1)) y) "C")
                         (cond
                           [(equal? (vector-ref (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                            (vector-set! (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "C")
                            (set! size 2)
                            (CruiserPosition 3)(draw)]
                           )]
                        )
                      (println "- x 1 #f"))
                   
                   (if(< (+ x 1) 4)
                      (cond
                        [(equal? (vector-ref (vector-ref board1 (+ x 1)) y) "C")
                         (cond
                           [(equal? (vector-ref (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                            (vector-set! (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "C")
                            (set! size 2)
                            (CruiserPosition 3)
                            (draw)]
                           )]
                        )
                      (println "- x 1 #f"))

                   (if(>= (- y 1) 0)
                      (cond
                        [(equal? (vector-ref (vector-ref board1 x) (- y 1)) "C")
                         (cond
                           [(equal? (vector-ref (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                            (vector-set! (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "C")
                            (set! size 2)
                            (CruiserPosition 3)
                            (draw)]
                           )]
                        )
                      (println "- x 1 #f"))
                   
                   (if(< (+ y 1) 4)
                      (cond
                        [(equal? (vector-ref (vector-ref board1 x) (+ y 1)) "C")
                         (cond
                           [(equal? (vector-ref (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                            (vector-set! (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3))(vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "C")
                            (set! size 2)
                            (CruiserPosition 3)
                            (draw)]
                           )]
                        )
                      (println "- x 1 #f"))]
                  (ErrorMessage 1)
                  )]

               [(= size 2)
                (cond
                  [(regexp-match #rx"(A1|B1|C1|D1|A2|B2|C2|D2|A3|B3|C3|D3|A4|B4|C4|D4)" (string-upcase txt))
                   (set! y (vector-ref (hash-ref PositionTable (string-upcase txt)) 2))
                   (set! x (vector-ref (hash-ref PositionTable (string-upcase txt)) 3))
                   (println x)(println y)
                   
                   (if(>= (- x 2) 0)
                      (cond
                        [(and(equal? (vector-ref (vector-ref board1 (- x 1)) y) "C")(equal? (vector-ref (vector-ref board1 (- x 2)) y) "C"))
                         (cond
                           [(= (vector-ref (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                            (vector-set! (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "C")
                            (set! size 0)
                            (set! Cruiser 1)
                            (DestroyerPosition 1)
                            (draw)]
                           )]
                        )
                      (println "- x 1 #f"))

                   (if(< (+ x 2) 4)
                      (cond
                        [(and(equal? (vector-ref (vector-ref board1 (+ x 1)) y) "C")(equal? (vector-ref (vector-ref board1 (+ x 2)) y) "C"))
                         (cond
                           [(= (vector-ref (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                            (vector-set! (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "C")
                            (set! size 0)
                            (set! Cruiser 1)
                            (DestroyerPosition 1)
                            (draw)]
                           )]
                        )
                      (println "+ x 1 #f"))

                   (if(>= (- y 2) 0)
                      (cond
                        [(and(equal? (vector-ref (vector-ref board1 x) (- y 1)) "C")(equal? (vector-ref (vector-ref board1 x) (- y 2)) "C"))
                         (cond
                           [(= (vector-ref (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                            (vector-set! (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "C")
                            (set! size 0)
                            (set! Cruiser 1)
                            (DestroyerPosition 1)
                            (draw)]
                           )]
                        )(println "- Y 1 #f"))

                   (if(< (+ y 2) 4)
                      (cond
                        [(and(equal? (vector-ref (vector-ref board1 x) (+ y 1)) "C")(equal? (vector-ref (vector-ref board1 x) (+ y 2) "C")))
                         (cond
                           [(= (vector-ref (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                            (vector-set! (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "C")
                            (set! size 0)
                            (set! Cruiser 1)
                            (DestroyerPosition 1)
                            (draw)]
                           )]
                        )
                      (println "+ Y 1 #f"))
                   ]
                  (ErrorMessage 1)
                  )]
               )]
            
            [(= Destroyer 0)
             (cond
               [(= size 0)
                (cond
                  [(regexp-match #rx"(A1|B1|C1|D1|A2|B2|C2|D2|A3|B3|C3|D3|A4|B4|C4|D4)" (string-upcase txt))
                   (cond
                     [(equal? (vector-ref (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                      (vector-set! (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "D")
                      (set! size 1)
                      (DestroyerPosition 2)
                      (draw)]
                     )]
                  (ErrorMessage 1)
                  )]

               [(= size 1)
                (cond
                  [(regexp-match #rx"(A1|B1|C1|D1|A2|B2|C2|D2|A3|B3|C3|D3|A4|B4|C4|D4)" (string-upcase txt))
                   (set! y (vector-ref (hash-ref PositionTable (string-upcase txt)) 2))
                   (set! x (vector-ref (hash-ref PositionTable (string-upcase txt)) 3))

                   (if(>= (- x 1) 0)
                      (cond
                        [(equal? (vector-ref (vector-ref board1 (- x 1)) y) "D")
                         (cond
                           [(equal? (vector-ref (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                            (vector-set! (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "D")
                            (set! size 0)
                            (set! Cruiser 0)
                            (draw)
                            (set! currentPlayer 2)
                            (CruiserPosition 1)
                            (draw)]
                           )]
                        ) (println "- x 1 #f") )

                   (if(< (+ x 1) 4)
                      (cond
                        [(equal? (vector-ref (vector-ref board1 (+ x 1)) y) "D")
                         (cond
                           [(equal? (vector-ref (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                            (vector-set! (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3))(vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "D")
                            (set! size 0)
                            (set! Cruiser 0)
                            (draw)
                            (println "hello")
                            (set! currentPlayer 2)
                            (CruiserPosition 1)
                            (draw)]
                           )]
                        )
                      (println "- x 1 #f"))

                   (if(>= (- y 1) 0)
                      (cond
                        [(equal? (vector-ref (vector-ref board1 x) (- y 1)) "D")
                         (cond
                           [(equal? (vector-ref (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                            (vector-set! (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "D")
                            (set! size 0)
                            (set! Cruiser 0)
                            (draw)(println "hello")
                            (set! currentPlayer 2)
                            (CruiserPosition 1)
                            (draw)]
                           )]
                        )
                      (println "- x 1 #f"))

                   (if(< (+ y 1) 4)
                      (cond
                        [(equal? (vector-ref (vector-ref board1 x) (+ y 1)) "D")
                         (cond
                           [(equal? (vector-ref (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                            (vector-set! (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "D")
                            (set! size 0)
                            (set! Cruiser 0)
                            (draw)
                            (println "hello")
                            (set! currentPlayer 2)
                            (CruiserPosition 1)
                            (draw)]
                           )]
                        )
                      (println "- x 1 #f"))
                   ]
                  (ErrorMessage 1)
                  )]
               )]
            )]

         [(= currentPlayer 2)
          (cond
            [(= Cruiser 0)
             (cond
               [(= size 0)
                (cond
                  [(regexp-match #rx"(A1|B1|C1|D1|A2|B2|C2|D2|A3|B3|C3|D3|A4|B4|C4|D4)" (string-upcase txt))
                   (cond
                     [(equal? (vector-ref (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                      (vector-set! (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "C")
                      (set! size 1)
                      (CruiserPosition 2)
                      (draw)]
                     )]
                  (ErrorMessage 1)
                  )]

               [(= size 1)
                (cond
                  [(regexp-match #rx"(A1|B1|C1|D1|A2|B2|C2|D2|A3|B3|C3|D3|A4|B4|C4|D4)" (string-upcase txt))
                   (set! y (vector-ref (hash-ref PositionTable (string-upcase txt)) 2))
                   (set! x (vector-ref (hash-ref PositionTable (string-upcase txt)) 3))       

                   (if(>= (- x 1) 0)
                      (cond
                        [(equal? (vector-ref (vector-ref board2 (- x 1)) y) "C")
                         (cond
                           [(equal? (vector-ref (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                            (vector-set! (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "C")
                            (set! size 2)
                            (CruiserPosition 3)
                            (draw)]
                           )]
                        )
                      (println "- x 1 #f"))

                   (if(< (+ x 1) 4)
                      (cond
                        [(equal? (vector-ref (vector-ref board2 (+ x 1)) y) "C")
                         (cond
                           [(equal? (vector-ref (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                            (vector-set! (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "C")
                            (set! size 2)
                            (CruiserPosition 3)
                            (draw)]
                           )]
                        )
                      (println "- x 1 #f"))

                   (if(>= (- y 1) 0)
                      (cond
                        [(equal? (vector-ref (vector-ref board2 x) (- y 1)) "C")
                         (cond
                           [(equal? (vector-ref (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                            (vector-set! (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "C")
                            (set! size 2)
                            (CruiserPosition 3)
                            (draw)]
                           )]
                        )
                      (println "- x 1 #f"))

                   (if(< (+ y 1) 4)
                      (cond
                        [(equal? (vector-ref (vector-ref board2 x) (+ y 1)) "C")
                         (cond
                           [(equal? (vector-ref (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                            (vector-set! (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "C")
                            (set! size 2)
                            (CruiserPosition 3)
                            (draw)]
                           )]
                        )
                      (println "- x 1 #f"))
                   ]
                  (ErrorMessage 1)
                  )]

               [(= size 2)
                (cond
                  [(regexp-match #rx"(A1|B1|C1|D1|A2|B2|C2|D2|A3|B3|C3|D3|A4|B4|C4|D4)" (string-upcase txt))
                   (set! y (vector-ref (hash-ref PositionTable (string-upcase txt)) 2))
                   (set! x (vector-ref (hash-ref PositionTable (string-upcase txt)) 3))
                   (println x) (println y)

                   (if(>= (- x 2) 0)
                      (cond
                        [(and(equal? (vector-ref (vector-ref board2 (- x 1)) y) "C")(equal? (vector-ref (vector-ref board2 (- x 2)) y) "C"))
                         (cond
                           [(= (vector-ref (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                            (vector-set! (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "C")
                            (set! size 0)
                            (set! Cruiser 1)
                            (DestroyerPosition 1)
                            (draw)]
                           )]
                        )
                      (println "- x 1 #f"))

                   (if(< (+ x 2) 4)
                      (cond
                        [(and(equal? (vector-ref (vector-ref board2 (+ x 1)) y) "C")(equal? (vector-ref (vector-ref board2 (+ x 2)) y) "C"))
                         (cond
                           [(= (vector-ref (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                            (vector-set! (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "C")
                            (set! size 0)
                            (set! Cruiser 1)
                            (DestroyerPosition 1)
                            (draw)]
                           )]
                        )
                      (println "+ x 1 #f"))

                   (if(>= (- y 2) 0)
                      (cond
                        [(and(equal? (vector-ref (vector-ref board2 x) (- y 1)) "C")(equal? (vector-ref (vector-ref board2 x) (- y 2)) "C"))
                         (cond
                           [(= (vector-ref (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                            (vector-set! (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "C")
                            (set! size 0)
                            (set! Cruiser 1)
                            (DestroyerPosition 1)
                            (draw)]
                           )]
                        )
                      (println "- Y 1 #f"))

                   (if(< (+ y 2) 4)
                      (cond
                        [(and(equal? (vector-ref (vector-ref board2 x) (+ y 1)) "C")(equal? (vector-ref (vector-ref board2 x) (+ y 2) "C")))
                         (cond
                           [(= (vector-ref (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                            (vector-set! (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "C")
                            (set! size 0)
                            (set! Cruiser 1)
                            (DestroyerPosition 1)
                            (draw)]
                           )]
                        )
                      (println "+ Y 1 #f"))
                   ]
                  (ErrorMessage 1)
                  )]
               )]

            [(= Destroyer 0)
             (cond
               [(= size 0)
                (cond
                  [(regexp-match #rx"(A1|B1|C1|D1|A2|B2|C2|D2|A3|B3|C3|D3|A4|B4|C4|D4)" (string-upcase txt))
                   (cond
                     [(equal? (vector-ref (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                      (vector-set! (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "D")
                      (set! size 1)
                      (DestroyerPosition 2)
                      (draw)]
                     )]
                  (ErrorMessage 1)
                  )]

               [(= size 1)
                (cond
                  [(regexp-match #rx"(A1|B1|C1|D1|A2|B2|C2|D2|A3|B3|C3|D3|A4|B4|C4|D4)" (string-upcase txt))
                   (set! y (vector-ref (hash-ref PositionTable (string-upcase txt)) 2))
                   (set! x (vector-ref (hash-ref PositionTable (string-upcase txt)) 3))

                   (if(>= (- x 1) 0)
                      (cond
                        [(equal? (vector-ref (vector-ref board2 (- x 1)) y) "D")
                         (cond
                           [(equal? (vector-ref (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                            (vector-set! (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "D")
                            (draw)
                            (set! currentPlayer 1)
                            (set! start 1)
                            (shootRocket 1)
                            (draw)]
                           )]
                        )
                      (println "- x 1 #f"))

                   (if(< (+ x 1) 4)
                      (cond
                        [(equal? (vector-ref (vector-ref board2 (+ x 1)) y) "D")
                         (cond
                           [(equal? (vector-ref (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                           (vector-set! (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "D")
                           (draw)
                           (set! currentPlayer 1)
                           (set! start 1)
                           (shootRocket 1)
                           (draw)]
                           )]
                        )
                      (println "- x 1 #f"))

                   (if(>= (- y 1) 0)
                      (cond
                        [(equal? (vector-ref (vector-ref board2 x) (- y 1)) "D")
                         (cond
                           [(equal? (vector-ref (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                            (vector-set! (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "D")
                            (draw)
                            (set! currentPlayer 1)
                            (set! start 1)
                            (shootRocket 1)
                            (draw)]
                           )]
                        )
                      (println "- x 1 #f"))

                   (if(< (+ y 1) 4)
                      (cond
                        [(equal? (vector-ref (vector-ref board2 x) (+ y 1)) "D")
                         (cond
                           [(equal? (vector-ref (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0)
                            (vector-set! (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "D")
                            (draw)
                            (set! currentPlayer 1)
                            (set! size 2)
                            (set! start 1)
                            (shootRocket 1)
                            (draw)]
                           )]
                        )
                      (println "- x 1 #f"))
                   ]
                  (ErrorMessage 1)
                  )]
               )]
            )])]

      [(= start 1)
       (cond
         [(= currentPlayer 1)
          (cond
            [(regexp-match #rx"(A1|B1|C1|D1|A2|B2|C2|D2|A3|B3|C3|D3|A4|B4|C4|D4)" (string-upcase txt))
             (cond
               [(and
                 (not(equal? (vector-ref (vector-ref board2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0))
                 (not(equal? (vector-ref (vector-ref hitboard1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) "H")))
                (vector-set! (vector-ref hitboard1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "H")
                (draw)
                (shootRocket 2)
                (set! counter1 (- counter1 1))
                (checkCounter)]
               [(not(equal? (vector-ref (vector-ref hitboard1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) "H"))
                (vector-set! (vector-ref hitboard1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "M")
                (set! currentPlayer 2)
                (shootRocket 1)
                (draw)]
               )]
            )]

         [(= currentPlayer 2)
          (cond
            [(regexp-match #rx"(A1|B1|C1|D1|A2|B2|C2|D2|A3|B3|C3|D3|A4|B4|C4|D4)" (string-upcase txt))
             (cond
               [(and
                 (not(equal? (vector-ref (vector-ref board1 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) 0))
                 (not(equal? (vector-ref (vector-ref hitboard2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) "H") ))
                (vector-set! (vector-ref hitboard2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "H")
                (draw)
                (shootRocket 2)
                (set! counter2 (- counter2 1))
                (checkCounter)]
               [(not(equal? (vector-ref (vector-ref hitboard2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2)) "H"))
                (vector-set! (vector-ref hitboard2 (vector-ref (hash-ref PositionTable (string-upcase txt)) 3)) (vector-ref (hash-ref PositionTable (string-upcase txt)) 2) "M")
                (set! currentPlayer 1)
                (shootRocket 1)
                (draw)]
               )]
            )]
         )]
      )))

                               




;----------------------------------Window and GUI elements-------------------------------------


(define startFrame (new frame% [label "Battleships"] [min-height 400] [min-width 400] [alignment '(center center)]))


(define (on-new-button button event)
  (send startFrame show #f)
  (send myFrame show #t))
(define (on-quit-button button event)
  (send startFrame show #f))




(define new-button (new button%
                          [parent startFrame]
                          [label "New Game"]
                          [vert-margin 10]
                          [callback on-new-button]))


(define load-button(new button%
                          [parent startFrame]
                          [label "Load"]
                          [vert-margin 10]
                          [callback on-new-button]))


(define quit-button (new button%
                           [parent startFrame]
                           [label "Quit"]
                           [vert-margin 10]
                           [callback on-quit-button]))










;create the frame of the game
(define myFrame (new frame% [label" Battleships" ]
                     [width 800] [height 700] [style '(no-resize-border)][alignment '(center center)]))

(define hPan1 (new horizontal-panel% [parent myFrame]
                   [alignment '(center center)]))

        


(define hPan2 (new horizontal-panel% [parent myFrame]
                   [alignment '(center center)]))

(define can1 (new canvas% [parent hPan1][vert-margin 10][horiz-margin 20][min-width 120][min-height 110]

                  [paint-callback 
                   (λ(can1 dc1)


                     (define blue (new pen% [color "blue"] [width 10]))
                     (send dc1 set-pen blue)
                     (send dc1 draw-line 0 0 0 400)
                     (send dc1 draw-line 0 0 400 0)
                     (send dc1 draw-line 375 0 375 375)
                     (send dc1 draw-line 0 315 375 315)
                     
                     (define black (new pen% [color "black"] [width 2]))
                     (send dc1 set-pen black)
                  
                     
                     (send dc1 draw-line 0 78 375 78)
                     (send dc1 draw-line 0 156 375 156)
                     (send dc1 draw-line 0 234 375 234)
                     (send dc1 draw-line 94 0 94 375)
                     (send dc1 draw-line 188 0 188 375)
                     (send dc1 draw-line 282 0 282 375)
                     

                     )]))







(define textarea (new text-field% [parent hPan1][label ""][vert-margin 10] [horiz-margin 10][style '(multiple)]))

(define can2 (new canvas% [parent hPan2][min-height 110][min-width 120][horiz-margin 20][vert-margin 10]


                  [paint-callback 
                   (λ(can2 dc2)

                     (define red (new pen% [color "red"] [width 10]))
                     (send dc2 set-pen red)
                     (send dc2 draw-line 0 0 0 400)
                     (send dc2 draw-line 0 0 400 0)
                     (send dc2 draw-line 375 0 375 375)
                     (send dc2 draw-line 0 315 375 315)
                    
                     (define black (new pen% [color "black"] [width 2]))
                     (send dc2 set-pen black)
                  
                     
                     (send dc2 draw-line 0 78 375 78)
                     (send dc2 draw-line 0 156 375 156)
                     (send dc2 draw-line 0 234 375 234)
                     (send dc2 draw-line 94 0 94 375)
                     (send dc2 draw-line 188 0 188 375)
                     (send dc2 draw-line 282 0 282 375)
                     
                       
                     

                     )]
                  ))

(define hSubPan (new vertical-panel% [parent hPan2]
                     [alignment '(center center)]))

(define textfield (new text-field% [parent hSubPan] [label ""][horiz-margin 10]))

(define startButton (new button% [parent hSubPan] [label "start"][callback (lambda (button event)  (send startButton enable #f)(send insertButton enable #t)(CruiserPosition 1))]))

(define insertButton (new button% [parent hSubPan] [label "enter"][callback (lambda (button event) (set! txt (send textfield get-value))(insertShip))]))

(send insertButton enable #f)



;send myFrame show #t)

(define setupGame (lambda () 
                              
                    (send textarea set-value
                          "Welcome to Battleships \n At the start of the game each player places their 3 ships \n - From there players take turn shooting rockets into the enemy sea space \n - The small ship is sunk with 1 rocket and the big ship is sunk with 2 rockets \n - The first player to sink 3 ships wins \n Press start to start the game")
                              
                              
                    ))

(send startFrame show #t)
(setupGame)
