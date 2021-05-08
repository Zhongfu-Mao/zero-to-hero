public interface Stack<T> {
    int getSize();

    void push(T item);

    boolean isEmpty();

    T pop();

    T peek();
}
