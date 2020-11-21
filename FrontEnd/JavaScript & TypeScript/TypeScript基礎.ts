/** データタイプ */

let isDone: boolean = false,  // Boolean
    count: number = 10, // Number
    firstName: string = "naruto"; //String

const sym = Symbol(); // Symbol
let obj = {
    [sym]: "symbol type",
};

let list1: number[] = [1, 2, 3]; // Array
let list2: Array<number> = [1, 2, 3];

enum Direction1 { // 数字列挙型
    NORTH,
    SOUTH,
    EAST,
    WEST,
}
let dir: Direction1 = Direction1.NORTH;

enum Direction2 { //　文字列列挙型
    NORTH = "NORTH",
    SOUTH = "SOUTH",
    EAST = "EAST",
    WEST = "WEST"
}

const enum Direction3 {
    NORTH,
    SOUTH,
    EAST,
    WEST
}
let dir3: Direction3 = Direction3.NORTH; // コンパイルした結果は var dir3 = 0

enum Enum {
    A,
    B,
    C = "C",
    D = "D",
    E = 8,
    F // 9
}

let notSure: any = 666; // Any
let valueAny: any; // OK
valueAny.foo.bar; // OK
valueAny.trim(); // OK
valueAny(); // OK
new valueAny(); // OK

let valueUnknown: unknown; // Unknown
valueUnknown = true; // OK
valueUnknown = 42; // OK
valueUnknown = "Hello World"; // OK
valueUnknown = []; // OK
valueUnknown = {}; // OK
valueUnknown = Math.random; // OK
valueUnknown = null; // OK
valueUnknown = undefined; // OK
valueUnknown = new TypeError(); // OK
valueUnknown = Symbol("type"); // OK

let value: unknown;
let value1: unknown = value,  // OK
    value2: any = value,  // OK
    value3: boolean = value,  // Error
    value4: number = value,  // Error
    value5: string = value,  // Error
    value6: object = value,  // Error
    value7: any[] = value,  // Error
    value8: Function = value;  // Error

value.foo.bar;  // Error
value.trim();  // Error
value();  // Error
new value();  // Error

let tupleType: [string, boolean]; //Tuple
tupleType = ["naruto", true];

function warnUser(): void { // Void 
    console.log("this is a warning message");
}

let u: undefined = undefined; // Undefined
let n: null = null; // Null

interface ObjectConstructor {
    create(o: object | null): any; // Object
}

const obj2 = {}; // {} Type

function error(message: string): never { // Never
    throw new Error(message);
}
function infiniteLoop(): never {
    while (true) {} // 戻り値は存在しない
}
