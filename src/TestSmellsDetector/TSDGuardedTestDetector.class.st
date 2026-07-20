"
I detect if there are conditional test including branches like ifTrue:aBlock or ifFalse:aBlock
"
Class {
	#name : 'TSDGuardedTestDetector',
	#superclass : 'TSDSmellDetector',
	#instVars : [
		'methodVisitor',
		'conditionalSelector'
	],
	#category : 'TestSmellsDetector-Detectors',
	#package : 'TestSmellsDetector',
	#tag : 'Detectors'
}

{ #category : 'testing' }
TSDGuardedTestDetector >> HasConditionalTest [

	^ self methodVisitor helperSelectors includesAny: #conditionalSelector
]

{ #category : 'testing' }
TSDGuardedTestDetector >> IsGuardedTest [

	self analyzeMethod.
	^ methodVisitor containconditionaltest.

]

{ #category : 'testing' }
TSDGuardedTestDetector >> IsGuardedTest: aMethode [

	| fixture classes |
	classes := Smalltalk allClasses select: [:c | c includesSelector: aMethode ].
	fixture := classes first >> aMethode .
	^ (fixture sendNodes select: [ :m | self conditionalSelector includes: m selector ]) isNotEmpty
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

{ #category : 'accessing' }
TSDGuardedTestDetector >> conditionalSelector [

	^ conditionalSelector ifNil: [ conditionalSelector := #(#ifTrue: #ifFalse: #ifNil:) ]
]

{ #category : 'accessing' }
TSDGuardedTestDetector >> conditionalSelector: anObject [

	conditionalSelector := anObject
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
