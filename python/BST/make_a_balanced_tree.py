class Node:
    """ A node in a BST. It may have left and right subtrees """
    def __init__(self, item, left = None, right = None):
        self.item = item
        self.left = left
        self.right = right

class BST:
    """ An implementation of a Binary Search Tree """
    def __init__(self):
        self.root = None

##################################################################################
    def recurse_add(self, ptr, item):
        if ptr == None:
            return Node(item)
        elif item < ptr.item:
            ptr.left = self.recurse_add(ptr.left, item)
        elif item > ptr.item:
            ptr.right = self.recurse_add(ptr.right, item)
        return ptr
        
    def add(self, item):
        """ Add this item to its correct position on the tree """
        self.root = self.recurse_add(self.root, item)

    def make_list(lst, nlst = None):
        lst = sorted(lst)
        if not nlst:
            nlst = list()
        if len(lst) == 0:
            return nlst

        i = len(lst) // 2
        if lst[i] not in nlst:
            nlst.append(lst[i])
        return make_list(lst[i+1:], nlst) and make_list(lst[:i], nlst)
####################################################################################

def main():
    tree = BST()
    for x in [10, 20, 30]:
        tree.add(x)