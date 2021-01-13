from playLA.Vector import Vector

if __name__ == "__main__":

    vec = Vector([5, 2])
    print(vec)
    print(f"len(vec) = {len(vec)}")
    print(f"vec[0] = {vec[0]}, vec[1] = {vec[1]}")

    vec2 = Vector([3, 1])
    print(f"{vec} + {vec2} = {vec + vec2}")
    print(f"{vec} - {vec2} = {vec - vec2}")

    print(f"{vec} * 3 = {vec * 3}")
    print(f"3 * {vec} = {3 * vec}")

    print(f"+{vec} = {+vec}")
    print(f"-{vec} = {-vec}")

    zero2 = Vector.zero(2)
    print(zero2)
    print(f"{vec} + {zero2} = {vec + zero2}")

    print(f"norm({vec}) = {vec.norm()}")
    print(f"norm({vec2}) = {vec2.norm()}")
    print(f"norm({zero2}) = {zero2.norm()}")

    print(f"normalize {vec} is {vec.normalize()}")
    print(vec.normalize().norm())

    print(f"normalize {vec2} is {vec2.normalize()}")
    print(vec2.normalize().norm())

    try:
        zero2.normalize()
    except ZeroDivisionError:
        print(f"Cannot normalize zero vector {zero2}.")

    print(vec.dot(vec2))
