public class BSTSet<E extends Comparable<E>> implements Set<E> {
    private BST<E> bst;

    public BSTSet() {
        bst = new BST<E>();
    }

    @Override
    public int getSize() {
        return bst.size();
    }

    @Override
    public boolean isEmpty() {
        return bst.isEmpty();
    }

    @Override
    public void add(E element) {
        bst.add(element);
    }

    @Override
    public boolean contains(E element) {
        return bst.contains(element);
    }

    @Override
    public void remove(E element) {
        bst.remove(element);
    }
}
