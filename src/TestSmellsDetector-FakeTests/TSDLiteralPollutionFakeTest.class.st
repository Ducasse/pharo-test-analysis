Class {
	#name : 'TSDLiteralPollutionFakeTest',
	#superclass : 'TestCase',
	#category : 'TestSmellsDetector-FakeTests',
	#package : 'TestSmellsDetector-FakeTests'
}

{ #category : 'tests' }
TSDLiteralPollutionFakeTest >> testWithLiteralPollution [
	| a b c d |
	a := 10.
	b := 20.
	c := 30.
	d := 'hola'.
	self assert: a + b + c equals: 60
]
