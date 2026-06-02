Class {
	#name : 'TSDTooManyAssertionsFakeTest',
	#superclass : 'TestCase',
	#category : 'TestSmellsDetector-FakeTests',
	#package : 'TestSmellsDetector-FakeTests'
}

{ #category : 'tests' }
TSDTooManyAssertionsFakeTest >> testWithTooManyAssertions [
    self assert: true.
    self assert: true.
    self assert: true.
    self assert: true.
    self assert: true.
    self assert: true.
    self assert: true.
    self assert: true.
    self assert: true.
    self assert: true.
]
