package main

import (
	"fmt"
	"io"
	"os"
)

type node struct {
	val   int
	left  *node
	right *node
}

type tree struct {
	root *node
}

func (n *node) insert(val int) {
	if n == nil {
		return
	} else if val <= n.val {
		if n.left == nil {
			n.left = &node{val: val, left: nil, right: nil}
		} else {
			n.left.insert(val)
		}
	} else {
		if n.right == nil {
			n.right = &node{val: val, left: nil, right: nil}
		} else {
			n.right.insert(val)
		}
	}
}

func print(w io.Writer, node *node, ns int, ch rune) {
	if node == nil {
		return
	}

	for i := 0; i < ns; i++ {
		fmt.Fprint(w, " ")
	}
	fmt.Fprintf(w, "%c:%v\n", ch, node.val)
	print(w, node.left, ns+2, 'L')
	print(w, node.right, ns+2, 'R')
}

func main() {
	tree := &tree{
		&node{
			val: 1,
		},
	}
	tree.root.left = &node{
		val: 2,
	}
	tree.root.right = &node{
		val: 3,
	}
	tree.root.left.left = &node{
		val: 4,
	}
	tree.root.left.right = &node{
		val: 5,
	}
	tree.root.left.right.left = &node{
		val: 6,
	}
	tree.root.left.right.right = &node{
		val: 7,
	}
	tree.root.left.right.right.left = &node{
		val: 8,
	}
	// tree.insert(1).
	// 	insert(2).
	// 	insert(3).
	// 	insert(4).
	// 	insert(5).
	// 	insert(6).
	// 	insert(7).
	// 	insert(8).
	// 	insert(9)

	print(os.Stdout, tree.root, 0, 'M')
}
