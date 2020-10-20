# YAMLとJSONを簡単に比較する

## [JSON](https://developer.mozilla.org/ja/docs/Learn/JavaScript/Objects/JSON)

JSON (JavaScript Object Notation) は値とオブジェクトを表現する一般的な形式である

### 文法(syntax)

JavaScriptには8つの基本型があります。

* number: あらゆる種類の数値: 整数または浮動小数点
* String: 文字列。文字列は1つかより多くの文字を持ち、別の1文字型はない
* Boolean: true/false
* null: 不明な値 – 単一の値 null を持つスタンドアロン型
* undefined: 未割り当て値 – 単一の値 undefined を持つスタンドアロン型
* object: より複雑なデータ構造
* Symbol: 一意な識別子
* BigInt: 任意の長さの整数をサポートする特別な数値型

中に、  
`number`,`String`,`Boolean`,`null`はJavaScriptの文法を利用することはできる。  
`object`は決まるルールで変換する。配列は特別なobjectとして扱われる  
`undefined`,`BigInt`は利用できない。  
JSON.stringify() を使用するとき、`Symbol` をキーとしたプロパティは完全に無視される

### JavaScriptで処理する

JavaScriptは次のメソッドを提供しています:

* `JSON.stringify` : オブジェクトをJSONに変換
* `JSON.parse` : JSONをオブジェクトに変換

### Pythonで処理する

PythonでJSONを処理するならstandard libraryにある`json`を利用すればいい

### 可視化

## YAML

### 書き方

### PyYAMLを利用して処理する
