(defparameter *ch* () )
(defparameter *output* () )
 (defparameter stack '(eos)) 

(defparameter *isp* ())
	(setq *isp* (make-hash-table))
	(setf (gethash #\+ *isp*) 12)
	(setf (gethash #\- *isp*) 12)
	(setf (gethash #\* *isp*) 13)
	(setf (gethash #\/ *isp*) 13)
	(setf (gethash #\% *isp*) 13)
	(setf (gethash #\( *isp*) 0)
	(setf (gethash #\) *isp*) 19)
	(setf (gethash 'eos *isp*) 0)


(defparameter *icp* ())
	(setq *icp* (make-hash-table))
	(setf (gethash #\+ *icp*) 12)
	(setf (gethash #\- *icp*) 12)
	(setf (gethash #\* *icp*) 13)
	(setf (gethash #\/ *icp*) 13)
	(setf (gethash #\% *icp*) 13)
	(setf (gethash #\( *icp*) 20)
	(setf (gethash #\) *isp*) 19)
	(setf (gethash 'eos *isp*) 0)



  (defun main()
	     (do ((input )
			  (line (read-line nil  nil :eof) (read-line nil nil :eof)))
			  ((eql line :eof))
	
					(setq input (concatenate 'list line " " ))
					(getchar input)
					(setq input ())
		 )			
		(do ((i 0 (+ i 1)) )
			((> i (- (length *ch*) 1) ))	
					(if	(not (eql (nth i *ch*) 'z) )
						(if (> (length (nth i *ch*)) 1)
							(progn
								(format t "~A~A " (nth 0 (nth i *ch*)) (nth 1 (nth i *ch*) ) ) )
							(progn 
								(case (car (nth i *ch*)) 
				
									( ( #\) ) ( do((x (pop stack) (pop stack)))
											 ((eql x #\( )) 
										(if (eql i (- (length *ch*) 1))
											(if (eql (length stack) 2)
											(progn
												(format t "~A" x)) 
											(progn
												(format t "~A " x))	)
											(progn
												(format t "~A " x)
											)))
									)
									( (#\( #\+ #\- #\* #\/ #\%)
										(progn (do( (a 0 ) )
											((< (gethash (nth a stack) *isp*) (gethash (car(nth i *ch*)) *icp*)) )
												(format t "~A " (pop stack)))			
											(push (car(nth i *ch*)) stack))
									)
									(otherwise
										(progn
											(format t "~A " (car (nth i *ch*))))
									))))
					(progn
					(do ((b (pop stack) (pop stack) ))
					    ((eql b 'eos))
						(if (eql 'eos (car stack) )
						(progn
					     (format t "~A" b)) 
						(progn
					     (format t "~A " b)) 
						)
					)
					(format t "~%") 
					(setq stack '(eos) )		
					)
				)
			)
)

(defun getchar (str)
	 (do ((s 0  (+ 1 (position #\  str :start s))))
		 ((> s (- (length str) 1) ))
	     ( setf  *ch* (concatenate 'list *ch* (list  (subseq str s (position #\  str :start s)) )))	)
	 (let ( (a '(z)))
	 (setf *ch* (concatenate 'list *ch* a ))
	 )
)

(main)
