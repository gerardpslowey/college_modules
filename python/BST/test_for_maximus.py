#
#   Test whether the BST is maximal
#

def test(lst):
    bst = BST()

    # Add each element in the lst to the tree
    for n in lst:
        bst.add(n)

    # Print the list and whether or not the resulting tree is maximal
    print("bst.is_maximal(" + str(lst) + ") is " + str(is_maximal(bst)))

def is_maximal(bst):
    return((2** int(bst.height()))-1)==int(bst.count())