# Learn Angular

## 準備

* [Node.js & npm(Node Package Manager, node.jsに内蔵されている)](https://nodejs.org/ja/)
* [Git](https://git-scm.com/downloads)
* [VS Code](https://code.visualstudio.com/download)
  * Angular Language Service
  * Angular Snippets
  * Nx console
  * TSLint
  * vscode-icons

## Angular CLI

> インストール: `npm install(i) -g @angular/cli[@major.minor.patch]`  
> バージョン確認： `ng version(v)`

### CLI commands

> `ng command [options]`

* help: コマンド一覧
* new(n) \<application name>: 新しいアプリケーションを作る
* build(b):　コンパイルする
* generate(g):　アプリケーションに構成するファイルを作成する
* serve(s):　アプリケーションをビルドして指定のサーバーを立ち上げる
* test(t):　単体テスト
* deploy:　デプロイメントする
* add:　3rd-partyライブラリをインストールする
* update:　ライブラリー、npmパッケージなど依存されるものを更新する

## Component interaction & inter-communication

* property binding
  * 例: `<span [innerText]="title"></span>`
  * 例: `<span [innerText]="'title'"></span>`: `title` -> HTML
    * **target property**: `innerText`
    * **template expression**: `title` -> component *public* property(DOM)
* class binding
  * 例: `<p [class.star]="isLiked"></p>`
    * `isLiked`は`true`の場合、`star`classは`p`に追加される；逆の場合は削除される
  * 複数同時: `<p [class]="currentClasses"></p>`
    * `currentClasses`は以下のような形式で良い：
      * 'star, active' -> classの名前の文字列
      * `currentClasses = {star: true, active: false};` -> Object(keysはclass名, valuesはboolean)
* style binding
  * 例: `<p [style.color]="'greenyellow'"></p>`
  * 例: `<p [style.width.px]="100"></p>`
  * 複数同時: `<p [style]="currentStyle"></p>`
    * `currentStyle`は以下のような形式で良い：
      * 'color: greenyellow; width: 100px' -> ";"でcss styleを結合する文字列
      * `currentStyle = {color: 'greenyellow', width: '100px'};` -> Object(keysはstyle名, valuesはstyle値)
* event binding
  * 例: `<button (click)="onClick()">Click me</button>`
    * **target event**: `click` -> [DOM events](https://developer.mozilla.org/ja/docs/Web/Events)
    * **template statement**: `onClick` -> component *public* method

![Component-template interaction](https://angular.io/generated/images/guide/architecture/component-databinding.png)

* input binding
  * 例:
    * *hero.component.ts* -> `@Input() name: string`
    * *hero.component.html* -> `<p>{{name}} hero works!</p>`
    * *app.component.html* -> `<app-hero [name]="hero"></app-hero>`
    * *app.component.ts* -> `export class AppComponent { hero = 'Spiderman' }`
* output binding
  * 例:
    * *hero.component.ts* -> `@Output() liked: new EventEmitter();`
    * *hero.component.html* -> `<button (click)="liked.emit()">Like</button>`
    * *app.component.html* -> `<app-hero [name]="hero" (liked)="onLike()"></app-hero>`
    * *app.component.ts* -> `export class AppComponent { onLike() {window.alert(`I like ${this.hero}`); }`

![Component inter-communication](https://www.infragistics.com/community/resized-image/__size/292x270/__key/communityserver-blogs-components-weblogfiles/dhananjay_5F00_kumar-componentcommunication/6507.img1.PNG)

* local reference

```html
<app-hero [name]="hero" (liked)="onLike()" #heroCmp></app-hero>
<span>{{heroCmp.name}}</span>
```

## component lifecycle

* OnInit
* OnDestory
* OnChanges
* DoCheck
* AfterContentInit
* AfterContentChecked
* AfterViewInit
* AfterViewChecked

## [ng-container, ng-content, ng-template](https://qiita.com/shibukawa/items/c8c7fd22c1054348db3a)
