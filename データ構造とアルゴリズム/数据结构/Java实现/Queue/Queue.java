public interface Queue<T> {
    int getSize();

    boolean isEmpty();

    void enqueue(T element);

    T dequeue();

    T getFront();
}
