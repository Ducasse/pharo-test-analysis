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
	(aMessageNode selector beginsWithAnyOf: { #assert . "#deny "}) ifTrue: [ self containsAssertMessageNode: true. ]
	"dans le cas d'un self guetter on renvoit true même sans assert et assert fonctionne aussi sur n'importe quel objet"
	
]
