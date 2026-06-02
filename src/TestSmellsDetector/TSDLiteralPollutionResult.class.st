Class {
	#name : 'TSDLiteralPollutionResult',
	#superclass : 'TSDSmellResult',
	#instVars : [
		'hasLiteralPollution'
	],
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'converting' }
TSDLiteralPollutionResult >> asResultForDrTest [

	^ DTFTFMessageNode new
		message: (String streamContents: [ :stream |
			stream 
				print: (self testClass selector: self selector);
				<< ': ';
				<< (self hasLiteralPollution 
					ifTrue: [ 'has literal pollution' ]
					ifFalse: [ 'no literal pollution' ]) ]);
		browseMethod: (self testClass lookupSelector: self selector);
		yourself
]

{ #category : 'accessing' }
TSDLiteralPollutionResult >> hasLiteralPollution [
	^ hasLiteralPollution ifNil: [ false ]
]

{ #category : 'accessing' }
TSDLiteralPollutionResult >> hasLiteralPollution: aBoolean [
	hasLiteralPollution := aBoolean
]
