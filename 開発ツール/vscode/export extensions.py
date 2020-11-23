import json
import re
from pathlib import Path


path = Path.home() / ".vscode/extensions"

extensions = []
for p in path.iterdir():
    if str(p.name).startswith("."):  # .obsoleteを無視する
        continue
    extensions.append(re.split(r"-\d+\.\d+\.\d+", str(p.name))[0])

with open("extensions.json", "w") as f:
    json.dump({"recommendations": sorted(extensions)}, f, indent=2)
