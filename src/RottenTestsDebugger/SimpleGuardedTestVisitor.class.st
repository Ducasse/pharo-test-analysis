Class {
	#name : 'SimpleGuardedTestVisitor',
	#superclass : 'RTDMethodVisitor',
	#instVars : [
		'containconditionaltest',
		'conditionalselectors'
	],
	#category : 'RottenTestsDebugger-visitors',
	#package : 'RottenTestsDebugger',
	#tag : 'visitors'
}

{ #category : 'visiting' }
SimpleGuardedTestVisitor >> conditionalselectors [

	^ conditionalselectors 
]

{ #category : 'visiting' }
SimpleGuardedTestVisitor >> containconditionaltest [

	^ containconditionaltest 
]

{ #category : 'visiting' }
SimpleGuardedTestVisitor >> containconditionaltest: anobject [

	containconditionaltest := anobject 
]

{ #category : 'initialization' }
SimpleGuardedTestVisitor >> initialize [ 

	super initialize .
	containconditionaltest := false.
	conditionalselectors := { #ifTrue: . #ifFalse: . #ifNil: }
]

{ #category : 'visiting' }
SimpleGuardedTestVisitor >> visitMessageNode: aMessageNode [

	self visitNodes: aMessageNode.
	(conditionalselectors includes: aMessageNode selector) ifTrue: [ self containconditionaltest: true ].
	^ containconditionaltest 
	
]
