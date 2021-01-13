import numpy as np

if __name__ == "__main__":

    print(np.__version__)

    lst = [1, 2, 3]
    lst[0] = "Linear Algebra"
    print(lst)

    vec = np.array([1, 2, 3])
    print(vec)
    try:
        vec[0] = "Linear Algebra"
    except ValueError:
        print("element in numpy array must be the same type")

    print(np.zeros(5))
    print(np.ones(5))
    print(np.full(5, 666))

    print(vec)
    print("size =", vec.size)
    print("size =", len(vec))
    print(vec[0])
    print(vec[-1])
    print(vec[0: 2])
    print(type(vec[0: 2]))

    vec2 = np.array([4, 5, 6])
    print(f"{vec} + {vec2} = {vec + vec2}")
    print(f"{vec} - {vec2} = {vec - vec2}")
    print(f"2 * {vec} = {2 * vec}")
    print(f"{vec} * {vec2} = {vec * vec2}")
    print(f"{vec}.dot({vec2}) = {vec.dot(vec2)}")

    print(np.linalg.norm(vec))
    print(vec / np.linalg.norm(vec))
    print(np.linalg.norm(vec / np.linalg.norm(vec)))

    # zero3 = np.zeros(3)
    # print(zero3 / np.linalg.norm(zero3))
