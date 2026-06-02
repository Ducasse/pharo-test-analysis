Class {
	#name : 'TSDTooManyAssertionsDetector',
	#superclass : 'TSDSmellDetector',
	#category : 'TestSmellsDetector',
	#package : 'TestSmellsDetector'
}

{ #category : 'accessing' }
TSDTooManyAssertionsDetector >> assertionSelectors [
    ^ #(#assert: #deny: #assert:equals: #assert:description: #should:raise: #shouldnt:raise: #assert:identicalTo:)
]

{ #category : 'api' }
TSDTooManyAssertionsDetector >> buildResult: aResult [

	super buildResult: aResult.
	aResult hasTooManyAssertions: self detects
]

{ #category : 'testing' }
TSDTooManyAssertionsDetector >> detects [
    ^ self hasTooManyAssertions
]

{ #category : 'testing' }
TSDTooManyAssertionsDetector >> hasTooManyAssertions [
	| assertionsCount |
	assertionsCount := self compiledMethod ast sendNodes 
		count: [ :node | self assertionSelectors includes: node selector ].
	^ assertionsCount > self maxAssertions
]

{ #category : 'accessing' }
TSDTooManyAssertionsDetector >> maxAssertions [
    ^ 5
]

{ #category : 'accessing' }
TSDTooManyAssertionsDetector >> smellResultClass [
    ^ TSDTooManyAssertionsResult
]
