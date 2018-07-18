(defun tic-tac-toe() ; make work for setting at the same spot
	(let ((board (make-array '(3 3):initial-element '-))
		  (input-list nil)
		  (current-player 'x)
		  (current-intelligence "AI")
		  (AI-character 'x))
		(setf current-intelligence (ask-user-about-intelligence))
		(setf AI-character (change-AI-character current-intelligence))
		(do ((game-over-status (game-over board) (game-over board)))
		    (game-over-status (game-over board))
			(setf input-list (inner-loop board current-intelligence AI-character))
			(format t "Done with input, input is ~A ~%" input-list)
			(setf (aref board (car input-list) (cadr input-list)) current-player)
			(print-board board)
			(setf current-player (change-current-player current-player))
			(setf current-intelligence (change-current-intelligence current-intelligence))
		)))

(defun AI (board AI-character)
	(let ((root nil))
		(setf root (make-node :our-character AI-character)))
	(format t "AI is playing ~%")
	(read-input))


	

(defun ask-user-about-intelligence ()
	(format t "Who goes first, AI or human? ~% write \"human\" or \"AI\": ")
	(read-line))

(defun change-AI-character (current-intelligence)
	(if (equal current-intelligence "human")
		'o
		'x))

(defun inner-loop (board current-intelligence AI-character)
	(let ((input-list nil))
		(if (equal current-intelligence "human")
			(progn (format t "human is playing ~%") (setf input-list (read-input)))
			(setf input-list (AI board AI-character)))
		(if (equal '- (aref board (car input-list) (cadr input-list)))
			input-list
			(inner-loop board))))


(defun print-board(arr)
		(format t "~A ~A ~A ~%" (aref arr 0 0) (aref arr 0 1) (aref arr 0 2))
		(format t "~A ~A ~A ~%" (aref arr 1 0) (aref arr 1 1) (aref arr 1 2))
		(format t "~A ~A ~A ~%" (aref arr 2 0) (aref arr 2 1) (aref arr 2 2))
)

(defun change-current-player (current-player)
	(if (equal current-player 'x)
		'o
		'x))

(defun change-current-intelligence (current-intelligence)
	(if (equal current-intelligence "human")
		"AI"
		"human"))

(defun new-board-letter (current-player)
	(let ((input-letter 'x))
		(if (equal current-player 2)
			(setf input-letter 'o))
		input-letter))


(defun game-over(board)
	(cond 
	((check-row board 0))
	((check-row board 1))
	((check-row board 2))

	((check-col board 0))
	((check-col board 1))
	((check-col board 2))

	((check-diags board))

	((is-filled board) 0)

	(t nil)
	)
)

(defun check-row(board i)
	(cond
	((and (equal (aref board i 0) 'x) (equal (aref board i 1) 'x) (equal (aref board i 2) 'x)) 1)
	((and (equal (aref board i 0) 'o) (equal (aref board i 1) 'o) (equal (aref board i 2) 'o)) 2)
	(t nil)
	)
)

(defun check-col(board i)
	(cond
	((and (equal (aref board 0 i) 'x) (equal (aref board 1 i) 'x) (equal (aref board 2 i) 'x)) 1)
	((and (equal (aref board 0 i) 'o) (equal (aref board 1 i) 'o) (equal (aref board 2 i) 'o)) 2)
	(t nil)
	)
)
(defun check-diags(board)
	(cond
	((and (equal (aref board 0 0) 'x) (equal (aref board 1 1) 'x) (equal (aref board 2 2) 'x)) 1)
	((and (equal (aref board 0 0) 'o) (equal (aref board 1 1) 'o) (equal (aref board 2 2) 'o)) 2)

	((and (equal (aref board 2 0) 'x) (equal (aref board 1 1) 'x) (equal (aref board 0 2) 'x)) 1)
	((and (equal (aref board 2 0) 'o) (equal (aref board 1 1) 'o) (equal (aref board 0 2) 'o)) 2)

	(t nil)
	)
)

(defun is-filled(board)
	(cond
	((or (equal (aref board 0 0) '-) (equal (aref board 0 1) '-) (equal (aref board 0 2) '-)) nil)
	((or (equal (aref board 1 0) '-) (equal (aref board 1 1) '-) (equal (aref board 1 2) '-)) nil)
	((or (equal (aref board 2 0) '-) (equal (aref board 2 1) '-) (equal (aref board 2 2) '-)) nil)
	(t t)
	)
)

(defun read-input ()
	(let ((line (read-line)))
		(list (digit-char-p (char line 0)) (digit-char-p (char line 2)))))



(defstruct (node (:print-function
					(lambda (n s d) 
						(format s "The score of this node is: ~A ~%" (node-score n)))))
						
	our-character score (board nil) (lst nil))


(defun st-insert (st)
	(setf (node-lst st) (cons child (node-lst st))))


 (defun children-boards (board AI-character)
	(let ((lst-of-boards nil)
		  (new-board nil))
		(do ((i 0 (+ i 1)))
		    ((equal i 3) lst-of-boards)
			(do ((j 0 (+ j 1)))
			    ((equal j 3) lst-of-boards )
				(if (equal (aref board i j) '-)
					(progn
						(setf new-board board)
						(setf (aref new-board i j) AI-character)
						(setf lst-of-boards (cons new-board lst-of-boards)))
				)))))






















