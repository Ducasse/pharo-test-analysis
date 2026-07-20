Class {
	#name : 'TSDGuardedTestResult',
	#superclass : 'TSDSmellResult',
	#instVars : [
		'IsGuarded'
	],
	#category : 'TestSmellsDetector-Results',
	#package : 'TestSmellsDetector',
	#tag : 'Results'
}

{ #category : 'converting' }
TSDGuardedTestResult >> IsGuarded [

	^ IsGuarded 
]

{ #category : 'converting' }
TSDGuardedTestResult >> IsGuarded: anObject [

	IsGuarded := anObject
]

{ #category : 'converting' }
TSDGuardedTestResult >> asResultForDrTest [

	^ DTFTFMessageNode new
		message: (String streamContents: [ :stream |
			stream 
				print: (self testClass selector: self selector);
				<< ': ';
				<< (self IsGuarded
					ifTrue: [ 'is guarded' ]
					ifFalse: [ 'is not guarded' ]) ]);
		browseMethod: (self testClass lookupSelector: self selector);
		yourself
]
