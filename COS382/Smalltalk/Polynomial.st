'From Pharo5.0 of 16 April 2015 [Latest update: #50770] on 31 March 2017 at 4:25:05.975533 pm'!Object subclass: #Polynomial	instanceVariableNames: 'coefficient'	classVariableNames: ''	poolDictionaries: ''	category: 'COS382'!!Polynomial methodsFor: 'comparing' stamp: 'JonDenning 3/7/2017 16:58'!= aPoly
    "compares two polynomials"
    ^ coefficient = aPoly asArray ! !!Polynomial methodsFor: 'comparing' stamp: 'JonDenning 3/7/2017 16:55'!< aPoly
	^ self shouldNotImplement ! !!Polynomial methodsFor: 'comparing' stamp: 'JonDenning 3/7/2017 16:54'!!!= aPoly
	^ self ~= aPoly! !!Polynomial methodsFor: 'as yet unclassified' stamp: 'JonDenning 3/5/2015 17:37'!initialize
	super initialize.
	coefficient := #( 0 )! !!Polynomial methodsFor: 'as yet unclassified' stamp: 'DanielGrube 3/31/2017 15:31'!differentiate	"comment stating purpose of message"	| r arr sz |	sz := self degree + 1.	arr := Array new: sz - 1.	1 to: sz - 1 do: [ :i |		arr at: i put: ((self coefficient: i) * i) ].	r := Polynomial new initialize: arr.	^r.			! !!Polynomial methodsFor: 'as yet unclassified' stamp: 'DanielGrube 3/31/2017 15:16'!evaluate: aNumber	"p evaluate: 1.5 returns the polynomial p evaluated at 1.5"	| r sz |	sz := self degree + 1.	r := 0.	0 to: sz - 1 do: [ :i |		r := r + ((self coefficient: i) * (aNumber raisedTo: i)) ].	^r	! !!Polynomial methodsFor: 'as yet unclassified' stamp: 'JonDenning 3/7/2017 17:01'!coefficient: power
	"return coefficient of power term"
	(power >= coefficient size) ifTrue: [ ^ 0 ].
	^ coefficient at: power + 1! !!Polynomial methodsFor: 'as yet unclassified' stamp: 'JonDenning 3/7/2017 17:00'!asArray
	"return array representation"
	^ coefficient deepCopy! !!Polynomial methodsFor: 'as yet unclassified' stamp: 'DanielGrube 3/31/2017 15:19'!evaluate	"p evaluate displays a prompt window (see below) that accepts a value and prints to Transcript the value of the polynomial evaluated at that value"	| r sz s t x |	sz := self degree + 1.	r := 0.	s := String new.	s := 'Enter a number' asString.	x := UIManager default   		request:s withCRs   		initialAnswer:'0'   		title:'Enter a number'.	t := x asInteger.	r := self evaluate: t.	^r! !!Polynomial methodsFor: 'as yet unclassified' stamp: 'DanielGrube 3/31/2017 14:38'!sum: aPoly	"p sum: q returns the polynomial that is the sum of p and q"	| r arr sz |	sz := (self degree max: aPoly degree) + 1.	arr := Array new: sz.	0 to: sz - 1 do: [ :i |		arr at: i + 1 put: (self coefficient: i) + (aPoly coefficient: i) ].	r := Polynomial new initialize: arr.	^r.! !!Polynomial methodsFor: 'as yet unclassified' stamp: 'DanielGrube 3/31/2017 15:46'!graphFrom: fromNumber graphTo: toNumber	"comment stating purpose of message"	| diag |	diag := GETDiagramBuilder new.	diag lineDiagram    	height: 200;    	models: (fromNumber to: toNumber);    	y: [ :x | self evaluate: x ]; "Block uses parameter x"    	color: Color black;    	regularAxisAsInteger.	diag open.! !!Polynomial methodsFor: 'as yet unclassified' stamp: 'JonDenning 3/7/2017 17:01'!degree
	"return degree of polynomial"
	^ coefficient size - 1! !!Polynomial methodsFor: 'as yet unclassified' stamp: 'JonDenning 3/7/2017 17:02'!initialize: initValue
	"private: initialize coefficient instance variable"

	(initValue isKindOf: (self class))
		ifTrue: [ coefficient := (initValue asArray) deepCopy ]
		ifFalse: [
			(initValue isKindOf: Array)
				ifTrue: [ coefficient := initValue deepCopy ]
				ifFalse: [ self initialize ]
		]! !