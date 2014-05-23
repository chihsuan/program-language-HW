(defun Prime()
	(do ( (w 2 (+ w 1)) 
		  (count 0 0))
		((> w 1000))
		
		(do ( (i 2 (+ i 1)) )
			( (> i (sqrt w)) )
			(if ( eql (mod w i) 0) 
			(progn	 (setq count (+ count 1))
			)
			)
		)
		(if (eql count 0)
			(progn
				(format t "~A~%" w)
			)
		)
	)
)

(Prime)