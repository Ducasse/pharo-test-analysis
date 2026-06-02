Class {
	#name : 'TSDMagicLiteralResult',
	#superclass : 'TSDSmellResult',
	#instVars : [
		'hasMagicLiterals'
	],
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'converting' }
TSDMagicLiteralResult >> asResultForDrTest [

	| tmp2 |
	tmp2 := DTFTFMessageNode new.
	tmp2
		message: (String streamContents: [ :arg1 |
						 arg1
							 print: (self testClass selector: self selector);
							 << ': ';
							 << (self hasMagicLiterals
									  ifTrue: [ 'has magic literals' ]
									  ifFalse: [ 'no magic literals' ]) ]);
		browseMethod: (self testClass lookupSelector: self selector).
	^ tmp2 yourself
]

{ #category : 'accessing' }
TSDMagicLiteralResult >> hasMagicLiterals [
	^ hasMagicLiterals ifNil: [ false ]
]

{ #category : 'accessing' }
TSDMagicLiteralResult >> hasMagicLiterals: aBoolean [
	hasMagicLiterals := aBoolean
]
