import json
import subprocess
import os

subprocess.run([
    "powershell",
    "code",
    "--list-extensions",
    "> foo.txt"
])

with open("foo.txt", encoding="utf16") as f:
    names = f.readlines()

names = [name.rstrip("\n") for name in names]

with open("extensions.json", "w") as f:
    json.dump({"recommendations": names}, fp=f, indent=2)

os.remove("foo.txt")
