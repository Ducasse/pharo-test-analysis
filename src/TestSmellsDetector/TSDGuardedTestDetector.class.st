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
	^ self HasConditionalTest
]

{ #category : 'testing' }
TSDGuardedTestDetector >> IsGuardedTest: aMethode [

	| fixture helperMethods |
	fixture := aMethode .
	helperMethods := { #ifTrue: }.
	true ifTrue: [ true ].
	self assert: (fixture sendNodes select: [ :m | helperMethods includes: m selector ]) isNotEmpty
]

{ #category : 'testing' }
TSDGuardedTestDetector >> analyzeMethod [

	self methodVisitor analyzeMethod: self compiledMethod 
]

{ #category : 'accessing' }
TSDGuardedTestDetector >> conditionalSelector [

	^ conditionalSelector ifNil: [ conditionalSelector := #(#ifTrue: . #ifFalse: ) ]
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

	^ methodVisitor ifNil: [ methodVisitor := RTDHelperVisitor new ]
]

{ #category : 'accessing' }
TSDGuardedTestDetector >> methodVisitor: anObject [

	methodVisitor := anObject
]
