'From Pharo5.0 of 16 April 2015 [Latest update: #50770] on 31 March 2017 at 4:25:05.975533 pm'!
    "compares two polynomials"
    ^ coefficient = aPoly asArray ! !
	^ self shouldNotImplement ! !
	^ self ~= aPoly! !
	super initialize.
	coefficient := #( 0 )! !
	"return coefficient of power term"
	(power >= coefficient size) ifTrue: [ ^ 0 ].
	^ coefficient at: power + 1! !
	"return array representation"
	^ coefficient deepCopy! !
	"return degree of polynomial"
	^ coefficient size - 1! !
	"private: initialize coefficient instance variable"

	(initValue isKindOf: (self class))
		ifTrue: [ coefficient := (initValue asArray) deepCopy ]
		ifFalse: [
			(initValue isKindOf: Array)
				ifTrue: [ coefficient := initValue deepCopy ]
				ifFalse: [ self initialize ]
		]! !