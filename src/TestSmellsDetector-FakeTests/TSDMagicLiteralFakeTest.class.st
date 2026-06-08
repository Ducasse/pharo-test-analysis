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
	self assert: resultado equals: 30. "10, 20, and 30 are magic numbers here"
]
