Class {
	#name : 'TSDTooManyAssertionsResult',
	#superclass : 'TSDSmellResult',
	#instVars : [
		'hasTooManyAssertions'
	],
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'converting' }
TSDTooManyAssertionsResult >> asResultForDrTest [

	^ DTFTFMessageNode new
		message: (String streamContents: [ :stream |
			stream 
				print: (self testClass selector: self selector);
				<< ': ';
				<< (self hasTooManyAssertions 
					ifTrue: [ 'has too many assertions' ]
					ifFalse: [ 'has normal assertions' ]) ]);
		browseMethod: (self testClass lookupSelector: self selector);
		yourself
]

{ #category : 'accessing' }
TSDTooManyAssertionsResult >> hasTooManyAssertions [
	^ hasTooManyAssertions ifNil: [ false ]
]

{ #category : 'accessing' }
TSDTooManyAssertionsResult >> hasTooManyAssertions: aBoolean [
	hasTooManyAssertions := aBoolean
]
