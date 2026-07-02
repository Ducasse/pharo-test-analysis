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
		detector methodVisitor helperSelectors: #( assert: ).
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
1 halt.
	self deny: (self detector detectSelector: #testUsesInstanceVar)
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testHasConnectedAssertion [
1 halt.
	self deny: (self detector detectSelector: #testConnectedToAssertion)
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testHasConnectedAssertionTwice [

	self
		deny: (self detector detectSelector: #testConnectedToAssertion);
		deny: (self detector detectSelector: #testConnectedToAssertion)
]

{ #category : 'tests' }
TSDAssertionLessDetectorTest >> testIsAssertionLess [

	self deny: (self detector detectSelector: #testDoesNotAssert)
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
