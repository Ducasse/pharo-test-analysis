Class {
	#name : 'TSDMagicLiteralDetector',
	#superclass : 'TSDSmellDetector',
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'api' }
TSDMagicLiteralDetector >> buildResult: aResult [

	super buildResult: aResult.
	aResult hasMagicLiterals: self detects
]

{ #category : 'testing' }
TSDMagicLiteralDetector >> detects [
	^ self hasMagicLiterals
]

{ #category : 'testing' }
TSDMagicLiteralDetector >> hasMagicLiterals [
	| magicLiteralsCount |
	magicLiteralsCount := self compiledMethod ast statements size > 0 ifTrue: [ 
		(self compiledMethod ast allChildren select: [ :node | 
			node isLiteralNode and: [ 
				(node value = true) not and: [ 
				(node value = false) not and: [ 
				(node value = nil) not ] ] ] ]) size ] ifFalse: [ 0 ].
	^ magicLiteralsCount > 0
]

{ #category : 'accessing' }
TSDMagicLiteralDetector >> smellResultClass [
	^ TSDMagicLiteralResult
]
