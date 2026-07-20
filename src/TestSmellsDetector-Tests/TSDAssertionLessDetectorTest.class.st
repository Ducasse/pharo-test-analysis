"
A TSDAssertionLessDetectorTest is a test class for testing the behavior of TSDAssertionLessDetector
"
Class {
	#name : 'TSDAssertionLessDetectorTest',
	#superclass : 'TSDDetectorTest',
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'accessing' }
TSDAssertionLessDetectorTest >> detector [ 

	^ detector ifNil: [ detector := super detector.
		"detector methodVisitor helperSelectors: #( assert: )."
		^detector ]
]

{ #category : 'accessing' }
TSDAssertionLessDetectorTest >> detectorClass [ 

	^ TSDAssertionLessDetector 
]

{ #category : 'as yet unclassified' }
TSDAssertionLessDetectorTest >> fixtureScenarioCodeSmellNonExecutedassert [

	true ifFalse: [ self assert: true ]
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testHasAssertion [

	self deny: (self detector detectSelector: #testUsesInstanceVar)
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testHasAssertion2 [

	self deny: (self detector detectSelector: #testMultipleDetections)
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testHasConnectedAssertion [

	self assert: (self detector detectSelector: #testConnectedToAssertion)
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testHasConnectedAssertionTwice [

	self
		assert: (self detector detectSelector: #testConnectedToAssertion);
		assert: (self detector detectSelector: #testConnectedToAssertion)
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testHasNoAssertion2 [

	self assert: (self detector detectSelector: #testm1)
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testIsAssertionLess [

	self assert: (self detector detectSelector: #testDoesNotAssert)
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testSimpleExpectingAssertion [

	| fixture helperMethods |
	fixture := TSDAssertionLessDetectorTest >> #testSimpleExpectingAssertion.
	helperMethods := { #assert: }.
	self assert: (fixture sendNodes select: [ :m | helperMethods includes: m selector ]) isNotEmpty
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testSimpleExpectingNoAssertion [
	
	|fixture helperMethods |
	fixture:= (Number >> #negated).
	helperMethods:={ #assert: }.
	self assert: ( fixture sendNodes select: [ :m | helperMethods includes: m selector ]) isEmpty
]
