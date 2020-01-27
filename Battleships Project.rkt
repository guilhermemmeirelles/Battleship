#lang racket
(require racket/gui/base)


(define rows 4)
(define cols 4)


(define board (vector
               (vector 0 0 0 0)
               (vector 0 0 0 0)
               (vector 0 0 0 0)
               (vector 0 0 0 0)))

(define PosTableX (hash 
                   "A1" 0 
                   "B1" 94
                   "C1" 188 
                   "D1" 282 
                   "A2" 0 
                   "B2" 94 
                   "C2" 188 
                   "D2" 282 
                   "A3" 0 
                   "B3" 94
                   "C3" 188 
                   "D3" 282 
                   "A4" 0 
                   "B4" 94 
                   "C4" 188 
                   "D4" 282 
                    
                   )
  )

(define PosTableY (hash 
                   "A1" 0  
                   "B1" 78
                   "C1" 156 
                   "D1" 234 
                   "A2" 0 
                   "B2" 78 
                   "C2" 156 
                   "D2" 234 
                   "A3" 0 
                   "B3" 78
                   "C3" 156 
                   "D3" 234 
                   "A4" 0 
                   "B4" 78 
                   "C4" 156 
                   "D4" 234 
                    
                   )
  )



(define currentPlayer 1)

(define switchPlayer (lambda () (set! currentPlayer (- 3 currentPlayer))))

(define myFrame (new frame%
                     [label "Battleships"]
                     [width 800] [height 700] [style '(no-resize-border)][alignment '(center center)]))


(define hPan1 (new horizontal-panel% [parent myFrame]
                   [alignment '(center center)][border 0]))

        


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
(define textfield (new text-field% [parent hPan2] [label ""][horiz-margin 10]))

(define dc1 (send can1 get-dc))
(define dc2 (send can2 get-dc))

(send myFrame show #t)

(startGame)

(define startGame (lambda() (

                             (ships)

                             )


