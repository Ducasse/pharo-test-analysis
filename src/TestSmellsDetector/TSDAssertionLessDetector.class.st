"
I detect whether tests do not contain assertions
"
Class {
	#name : 'TSDAssertionLessDetector',
	#superclass : 'TSDSmellDetector',
	#instVars : [
		'methodVisitor'
	],
	#category : 'TestSmellsDetector-Detectors',
	#package : 'TestSmellsDetector',
	#tag : 'Detectors'
}

{ #category : 'private' }
TSDAssertionLessDetector >> analyzeMethod [

	self methodVisitor containsAssertMessageNode: false.
	self methodVisitor analyzeMethod: self compiledMethod 
]

{ #category : 'api' }
TSDAssertionLessDetector >> buildResult: aResult [

	super buildResult: aResult.
	aResult isAssertionLess: self isAssertionLess 
]

{ #category : 'testing' }
TSDAssertionLessDetector >> detects [
	^ self isAssertionLess 
]

{ #category : 'testing' }
TSDAssertionLessDetector >> hasNoAssertionSelectors [

"condition seems to always be false"
	^ self methodVisitor helperSelectors allSatisfy: [ :aHelperSelector | 
				(self methodVisitor helperSelectors includes: aHelperSelector) not ]
			"le 2e helperSelectors devrait être la liste des trucs trouvés dans la fonction analysée plutot que la liste des trucs qu'on cherche sinon on a une tautologie."
]

{ #category : 'testing' }
TSDAssertionLessDetector >> hasNohelpers [

	^ (self methodVisitor helpers at: self compiledMethod) isEmpty 
]

{ #category : 'testing' }
TSDAssertionLessDetector >> isAssertionLess [

	self analyzeMethod .
	^ self methodVisitor containAssertMessagNode not "pourquoi cette méthode est rangé dans les tests"
]

{ #category : 'accessing' }
TSDAssertionLessDetector >> methodVisitor [

	^ methodVisitor ifNil: [ methodVisitor := SimpleNoAssertVisitor new ]
]

{ #category : 'accessing' }
TSDAssertionLessDetector >> methodVisitor: anObject [

	methodVisitor := anObject
]

{ #category : 'accessing' }
TSDAssertionLessDetector >> smellResultClass [ 

	^ TSDAssertionLessResult 
]
