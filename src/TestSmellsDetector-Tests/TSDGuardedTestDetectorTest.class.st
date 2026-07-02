Class {
	#name : 'TSDGuardedTestDetectorTest',
	#superclass : 'TSDDetectorTest',
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'accessing' }
TSDGuardedTestDetectorTest >> detectorClass [
	^ TSDGuardedTestDetector
]

{ #category : 'running' }
TSDGuardedTestDetectorTest >> testIsGuarded [

1 halt.
	self assert: ( self detector detectSelector: #testifTrue )
]

{ #category : 'running' }
TSDGuardedTestDetectorTest >> testIsGuarded2 [

| fixture |
	1 halt.
	fixture := TSDGuardedTestDetectorTest >> #testSimpleExpectingGuarded.
	self assert: (self detectorClass IsGuardedTest: fixture )
]

{ #category : 'running' }
TSDGuardedTestDetectorTest >> testSimpleExpectingGuarded [

	| fixture helperMethods |
	1 halt.
	fixture := TSDGuardedTestDetectorTest >> #testSimpleExpectingGuarded.
	helperMethods := { #ifTrue: }.
	true ifTrue: [ true ].
	self assert: (fixture sendNodes select: [ :m | helperMethods includes: m selector ]) isNotEmpty
]

{ #category : 'running' }
TSDGuardedTestDetectorTest >> testSimpleExpectingGuarded2 [

	| fixture helperMethods |
	1 halt.
	fixture := TSDFakeTests >> #testifTrue.
	helperMethods := { #ifTrue: }.
	true ifTrue: [ true ].
	self assert: (fixture sendNodes select: [ :m | helperMethods includes: m selector ]) isNotEmpty
]

{ #category : 'running' }
TSDGuardedTestDetectorTest >> testSimpleExpectingGuarded3 [

	| fixture helperMethods |
	1 halt.
	fixture := TSDFakeTests >> #testifTrue.
	helperMethods := { #ifFalse: }.
	true ifTrue: [ true ].
	self deny: (fixture sendNodes select: [ :m | helperMethods includes: m selector ]) isNotEmpty
]
