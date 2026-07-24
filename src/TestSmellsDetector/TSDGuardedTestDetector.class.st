"
I detect if there are conditional test including branches like ifTrue:aBlock or ifFalse:aBlock
"
Class {
	#name : 'TSDGuardedTestDetector',
	#superclass : 'TSDSmellDetector',
	#instVars : [
		'methodVisitor'
	],
	#category : 'TestSmellsDetector-Detectors',
	#package : 'TestSmellsDetector',
	#tag : 'Detectors'
}

{ #category : 'testing' }
TSDGuardedTestDetector >> IsGuardedTest [

	self analyzeMethod.
	^ methodVisitor containconditionaltest.

]

{ #category : 'testing' }
TSDGuardedTestDetector >> analyzeMethod [

	self methodVisitor containconditionaltest: false.
	self methodVisitor analyzeMethod: self compiledMethod 
]

{ #category : 'testing' }
TSDGuardedTestDetector >> buildResult: aResult [

	super buildResult: aResult.
	aResult IsGuarded: self IsGuardedTest 

]

{ #category : 'testing' }
TSDGuardedTestDetector >> detects [

	^ self IsGuardedTest 
]

{ #category : 'accessing' }
TSDGuardedTestDetector >> methodVisitor [

	^ methodVisitor ifNil: [ methodVisitor := SimpleGuardedTestVisitor new ]
]

{ #category : 'accessing' }
TSDGuardedTestDetector >> methodVisitor: anObject [

	methodVisitor := anObject
]

{ #category : 'accessing' }
TSDGuardedTestDetector >> smellResultClass [

	^ TSDGuardedTestResult
]
