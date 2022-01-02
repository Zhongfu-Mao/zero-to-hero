# Connect

```python
from pymongo import MongoClient
import certifi

client = MongoClient("mongodb+srv://<username>:<password>@sandbox.piewq.mongodb.net/myFirstDatabase?retryWrites=true&w=majority",tlsCAFile=certifi.where())
```

