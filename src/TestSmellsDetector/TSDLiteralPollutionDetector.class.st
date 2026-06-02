Class {
	#name : 'TSDLiteralPollutionDetector',
	#superclass : 'TSDSmellDetector',
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'api' }
TSDLiteralPollutionDetector >> buildResult: aResult [

	super buildResult: aResult.
	aResult hasLiteralPollution: self detects
]

{ #category : 'testing' }
TSDLiteralPollutionDetector >> detects [
	^ self hasLiteralPollution
]

{ #category : 'testing' }
TSDLiteralPollutionDetector >> hasLiteralPollution [
	| literalsCount |
	literalsCount := self compiledMethod ast statements size > 0 ifTrue: [ 
		(self compiledMethod ast allChildren select: [ :node | 
			node isLiteralNode and: [ 
				node value isNumber or: [ 
				node value isString and: [ 
				node value isSymbol not ] ] ] ]) size ] ifFalse: [ 0 ].
	^ literalsCount > self maxLiterals
]

{ #category : 'accessing' }
TSDLiteralPollutionDetector >> maxLiterals [
	^ 3 "Si tiene más de 3 números/strings sueltos, se considera contaminado"
]

{ #category : 'accessing' }
TSDLiteralPollutionDetector >> smellResultClass [
	^ TSDLiteralPollutionResult
]
