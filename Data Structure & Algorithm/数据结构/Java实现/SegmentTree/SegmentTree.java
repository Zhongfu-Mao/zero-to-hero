public class SegmentTree<E> {
    private E[] data;
    private E[] tree;
    private Merger<E> merger;

    public SegmentTree(E[] array, Merger<E> merger) {
        this.merger = merger;

        data = (E[]) new Object[array.length];
        for (int i = 0; i < array.length; i++) {
            data[i] = array[i];
        }
        tree = (E[]) new Object[4 * array.length];
        buildSegmentTree(0, 0, array.length - 1);
    }

    private void buildSegmentTree(int treeIndex, int left, int right) {
        if (left == right) {
            tree[treeIndex] = data[left];
            return;
        }
        int leftTreeIndex = leftChild(treeIndex);
        int rightTreeIndex = rightChild(treeIndex);

        int middle = left + (right - left) / 2;
        buildSegmentTree(leftTreeIndex, left, middle);
        buildSegmentTree(rightTreeIndex, middle + 1, right);

        tree[treeIndex] = merger.merge(tree[leftTreeIndex], tree[rightTreeIndex]);
    }

    public int getSize() {
        return data.length;
    }

    public E get(int index) {
        if (index < 0 || index >= data.length) {
            throw new IllegalArgumentException("Index is out of bounds");
        }
        return data[index];
    }

    private int leftChild(int index) {
        return 2 * index + 1;
    }

    private int rightChild(int index) {
        return 2 * index + 2;
    }

    public E query(int queryLeft, int queryRight) {
        if (queryLeft < 0 || queryLeft >= data.length || queryRight < 0 || queryRight >= data.length) {
            throw new IllegalArgumentException("Index is out of bounds");
        }
        return query(0, 0, data.length - 1, queryLeft, queryRight);
    }

    private E query(int treeIndex, int left, int right, int queryLeft, int queryRight) {
        if (left == queryLeft && right == queryRight) {
            return tree[treeIndex];
        }

        int middle = left + (right - left) / 2;
        int leftTreeIndex = leftChild(treeIndex);
        int rightTreeIndex = rightChild(treeIndex);

        if (queryLeft >= middle + 1) {
            return query(rightTreeIndex, middle + 1, right, queryLeft, queryRight);
        } else if (queryRight <= middle) {
            return query(leftTreeIndex, left, middle, queryLeft, queryRight);
        }

        E leftResult = query(leftTreeIndex, left, middle, queryLeft, middle);
        E rightResult = query(rightTreeIndex, middle + 1, right, middle + 1, queryRight);

        return merger.merge(leftResult, rightResult);
    }

    public void set(int index, E element) {

        if (index < 0 || index >= data.length) {
            throw new IllegalArgumentException("Index is illegal");
        }

        data[index] = element;
        set(0, 0, data.length - 1, index, element);
    }

    private void set(int treeIndex, int left, int right, int index, E element) {

        if (left == right) {
            tree[treeIndex] = element;
            return;
        }

        int mid = left + (right - left) / 2;

        int leftTreeIndex = leftChild(treeIndex);
        int rightTreeIndex = rightChild(treeIndex);
        if (index >= mid + 1)
            set(rightTreeIndex, mid + 1, right, index, element);
        else // index <= mid
            set(leftTreeIndex, left, mid, index, element);

        tree[treeIndex] = merger.merge(tree[leftTreeIndex], tree[rightTreeIndex]);
    }

    @Override
    public String toString() {
        var sb = new StringBuilder();
        sb.append('[');
        for (int i = 0; i < tree.length; i++) {
            if (tree[i] != null) {
                sb.append(tree[i]);
            } else {
                sb.append("null");
            }

            if (i != tree.length) {
                sb.append(", ");
            }
        }
        sb.append(']');

        return sb.toString();
    }
}