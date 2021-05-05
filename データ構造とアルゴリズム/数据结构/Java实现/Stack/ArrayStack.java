public class ArrayStack<T> implements Stack<T> {
    Array<T> array;

    public ArrayStack(int capacity) {
        array = new Array<T>(capacity);
    }

    public ArrayStack() {
        array = new Array<T>();
    }

    @Override
    public int getSize() {
        return array.getSize();
    }

    @Override
    public boolean isEmpty() {
        return array.isEmpty();
    }

    public int getCapacity() {
        return array.getCapacity();
    }

    @Override
    public void push(T element) {
        array.addLast(element);
    }

    @Override
    public T pop() {
        return array.removeLast();
    }

    @Override
    public T peek() {
        return array.getLast();
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("Stack: ");
        builder.append("[");
        for (int i = 0; i < array.getSize(); i++) {
            builder.append(array.get(i));
            if (i != array.getSize() - 1) {
                builder.append(", ");
            }
        }
        builder.append("] Top");
        return builder.toString();
    }
}
