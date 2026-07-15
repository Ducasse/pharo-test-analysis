Class {
	#name : 'SimpleNoAssertVisitor',
	#superclass : 'RTDMethodVisitor',
	#instVars : [
		'containAssertMessagNode'
	],
	#category : 'RottenTestsDebugger-visitors',
	#package : 'RottenTestsDebugger',
	#tag : 'visitors'
}

{ #category : 'accessing' }
SimpleNoAssertVisitor >> containAssertMessagNode [

	^ containAssertMessagNode
]

{ #category : 'visiting' }
SimpleNoAssertVisitor >> containsAssertMessageNode: aBoolean [

	containAssertMessagNode := aBoolean
]

{ #category : 'initialization' }
SimpleNoAssertVisitor >> initialize [ 
	super initialize .
	containAssertMessagNode:= false.
]

{ #category : 'visiting' }
SimpleNoAssertVisitor >> visitMessageNode: aMessageNode [

	self visitNodes: aMessageNode.
	(aMessageNode receiver isSelfVariable 
		or: [ aMessageNode receiver isSuperVariable ]) 
			ifFalse: [ ^ self ].
	self containsAssertMessageNode: true.
	
]
