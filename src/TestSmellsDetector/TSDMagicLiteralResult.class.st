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

	| messageNode |
	messageNode := DTFTFMessageNode new.
	messageNode
		message: (String streamContents: [ :stream |
			stream
				print: (self testClass selector: self selector);
				<< ': ';
				<< (self hasMagicLiterals
					ifTrue: [ 'has magic literals' ]
					ifFalse: [ 'no magic literals' ]) ]);
		browseMethod: (self testClass lookupSelector: self selector).
	^ messageNode yourself
]

{ #category : 'accessing' }
TSDMagicLiteralResult >> hasMagicLiterals [
	^ hasMagicLiterals ifNil: [ false ]
]

{ #category : 'accessing' }
TSDMagicLiteralResult >> hasMagicLiterals: aBoolean [
	hasMagicLiterals := aBoolean
]
