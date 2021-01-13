from __future__ import annotations

import math
from typing import Iterable

from ._globals import EPSILON


class Vector:

    def __init__(self, lst: Iterable):
        self._values = list(lst)

    @classmethod
    def zero(cls, dim: int):
        return cls([0] * dim)

    def __add__(self, another: Vector):
        assert len(self) == len(another), \
            "Error in adding. Length of vectors must be same."

        return Vector([a + b for a, b in zip(self, another)])

    def __sub__(self, another: Vector):
        assert len(self) == len(another), \
            "Error in subtracting. Length of vectors must be same."

        return Vector([a - b for a, b in zip(self, another)])

    def norm(self):
        return math.sqrt(sum(e**2 for e in self))

    def normalize(self):
        if self.norm() < EPSILON:
            raise ZeroDivisionError("Normalize error! norm is zero.")
        return Vector(self._values) / self.norm()

    def dot(self, another: Vector):
        assert len(self) == len(another), \
            "Error in dot product. Length of vectors must be same."

        return sum(a * b for a, b in zip(self, another))

    def __mul__(self, k: float | int):
        return Vector([k * e for e in self])

    def __rmul__(self, k: float | int):
        return self * k

    def __truediv__(self, k: float | int):
        return (1 / k) * self

    def __pos__(self):
        return 1 * self

    def __neg__(self):
        return -1 * self

    def __iter__(self):
        return self._values.__iter__()

    def __getitem__(self, index: int):
        return self._values[index]

    def __len__(self):
        return len(self._values)

    def __repr__(self):
        return f"Vector({self._values})"

    def __str__(self):
        return f"({', '.join(str(e) for e in self._values)})"
