"
A TSDTooManyClassesDetectorTest is a test class for testing the behavior of TSDTooManyClassesDetector
"
Class {
	#name : 'TSDTooManyClassesDetectorTest',
	#superclass : 'TSDDetectorTest',
	#category : 'TestSmellsDetector-Tests',
	#package : 'TestSmellsDetector-Tests'
}

{ #category : 'accessing' }
TSDTooManyClassesDetectorTest >> detectorClass [ 

	^ TSDTooManyClassesDetector 
]

{ #category : 'tests' }
TSDTooManyClassesDetectorTest >> testDetects [
1 halt.
	self assert: (self detector detectSelector: #testUsesTooManyClasses)
]

{ #category : 'tests' }
TSDTooManyClassesDetectorTest >> testDetectsThenDenies [

	self
		assert: (self detector detectSelector: #testUsesTooManyClasses);
		deny: (self detector detectSelector: #testConnectedToAssertion)
]

{ #category : 'tests' }
TSDTooManyClassesDetectorTest >> testDetectsUsesOfTheSameClass [

	self assert: (self detector detectSelector: #testUsesTheSameClass)
]

{ #category : 'tests' }
TSDTooManyClassesDetectorTest >> testRemembersDetect [
1 halt.
	self
		assert: (self detector detectSelector: #testUsesTooManyClasses);
		deny: (self detector detectSelector: #testConnectedToAssertion);
		assert: (self detector detectSelector: #testUsesTooManyClasses) "pourquoi faire 2 fois le même test?"
]
