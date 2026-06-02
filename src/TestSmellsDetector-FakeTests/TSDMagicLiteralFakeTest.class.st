Class {
	#name : 'TSDMagicLiteralFakeTest',
	#superclass : 'TestCase',
	#category : 'TestSmellsDetector-FakeTests',
	#package : 'TestSmellsDetector-FakeTests'
}

{ #category : 'tests' }
TSDMagicLiteralFakeTest >> testWithMagicLiteral [
	| resultado |
	resultado := 10 + 20.
	self assert: resultado equals: 30. "El 30, el 10 y el 20 acá son números mágicos"
]
