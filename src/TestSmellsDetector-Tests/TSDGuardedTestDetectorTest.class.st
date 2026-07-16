Class {
	#name : 'TSDGuardedTestDetectorTest',
	#superclass : 'TSDDetectorTest',
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'running' }
TSDGuardedTestDetectorTest >> detector: aClass [

	detector := self detectorClass selfClass: aClass 
]

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

	1 halt.
	self detector: TSDGuardedTestDetectorTest.
	self assert: (self detector detectSelector: #testSimpleExpectingGuarded )
]

{ #category : 'running' }
TSDGuardedTestDetectorTest >> testIsGuarded3 [

1 halt.
	self assert: ( self detector detectSelector: #testifFalse )
]

{ #category : 'running' }
TSDGuardedTestDetectorTest >> testIsNotGuarded [

	1 halt.
	self detector: TSDGuardedTestDetectorTest.
	self deny: (self detector detectSelector: #testIsGuarded )
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
	self assert: (fixture sendNodes select: [ :m | helperMethods includes: m selector ]) isNotEmpty
]

{ #category : 'running' }
TSDGuardedTestDetectorTest >> testSimpleExpectingGuarded3 [

	| fixture helperMethods |
	1 halt.
	fixture := TSDFakeTests >> #testifTrue.
	helperMethods := { #ifFalse: }.
	self deny: (fixture sendNodes select: [ :m | helperMethods includes: m selector ]) isNotEmpty
]
