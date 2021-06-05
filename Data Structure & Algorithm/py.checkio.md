# 比较优秀的或者让人耳目一新的解法

## Elementary

### Easy Unpack

```python
from operator import itemgetter
easy_unpack = itemgetter(0, 2, ~1)
```

### Number Length

```python
import math

def number_length(a: int) -> int:
    return int(math.log10(a)) + 1 if a else 1
```

### End Zeros

```python
def end_zeros(num: int) -> int:
    return len(s := str(num)) - len(s.rstrip('0'))

def end_zeros(number):
    import re
    return len(re.search('0*$', str(number)).group())

def end_zeros(number):
    number = str(number)
    if number[-1:] != '0':
        return 0
    return 1 + end_zeros(number[:-1])

def end_zeros(number):
    if not number:
       return 1
    if not number % 10:
       return 1 + end_zeros(number // 10)
    return 0

def end_zeros(number):
    result = not number
    while number and not number % 10:
        number /= 10
        result += 1
    return result

def end_zeros(number):
    en = enumerate(str(number)[::-1])
    return not number or next(i for i, x in en if x != '0')

def end_zeros(number):
    from itertools import takewhile
    number = str(number)[::-1]
    return len(list(takewhile(lambda x: x == '0', number)))
```

### All Upper I

```python
def is_all_upper(text: str) -> bool:
    return text.upper() == text
```

### Replace First

```python
# Change items IN-PLACE.
def replace_first(items: list) -> list:
    if items:
        items.append(items.pop(0))
    return items

# Slices
def replace_first(items: list) -> list:
    return items[1:] + items[:1]

# collections.deque have an useful method: rotate.
from collections import deque
def replace_first(items: list) -> deque:
    items = deque(items)
    items.rotate(-1)
    return items
```

### Max Digit

```python
max_digit = lambda number: int(max(str(number)))
```

### Split Pairs

```python
def split_pairs(a):
    return [ch1+ch2 for ch1,ch2 in zip(a[::2],a[1::2]+'_')]

from textwrap import wrap
def split_pairs(a):
    a = a + '_' if len(a) % 2 else a
    return wrap(a, 2)
```

### Nearest Value

```python
def nearest_value(values: set, one: int) -> int:
    return min(values, key=lambda n: (abs(one - n), n))
```

## Home
