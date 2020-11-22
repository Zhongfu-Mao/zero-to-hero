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

interface Hero {
    name: string;
    power: Record<string, number>; // Record
}

const hero: Partial<Hero> = { // Partial
    name: "Iron man"
}

/** 断言 */

let someValue: any = "this is a string";
let strLength1: number = (<string>someValue).length;  // データタイプ断言、方法1
let strLength2: number = (someValue as string).length;  // データタイプ断言、方法2

const a: number | undefined = undefined;
const b: number = a!; // nullとundefinedを排除する

/** タイプをガイド */

//　方法１：`in`
interface Admin {
    name: string;
    privileges: string[];
}

interface Employee {
    name: string;
    startDate: Date;
}

type UnknownEmployee = Employee | Admin;

function printEmployeeInformation(emp: UnknownEmployee) {
    console.log(`Name: ${emp.name}`);
    if ("privileges" in emp) {
        console.log(`Privileges: ${emp.privileges}`);
    }
    if ("startDate" in emp) {
        console.log(`Start Date: ${emp.startDate}`);
    }
}

//　方法２: `typeof`
function padLeft(value: string, padding: string | number) {
    if (typeof padding === "number") {
        return Array(padding + 1).join(" ") + value;
    }
    if (typeof padding === "string") {
        return padding + value;
    }
    throw new Error(`Expected string or number , get '${padding}'`)
}

// 方法３：　`instanceof`
interface Padder {
    getPaddingString(): string;
}

class SpaceRepeatingPadder implements Padder {
    constructor(private numSpaces: number) {}
    getPaddingString() {
        return Array(this.numSpaces + 1).join(" ");
    }
}

let padder: Padder = new SpaceRepeatingPadder(6);

if (padder instanceof SpaceRepeatingPadder) {

}

// 方法4：自分で定義する
function isNumber(x: any): x is number {
    return typeof x === "number";
}

function isString(x: any): x is string {
    return typeof x === "string";
}

/** タイプの結合と別名 */

const sayHello = (name: string | undefined) => {

};

type EventNames = "click" | "scroll" | "mousemove";

enum CarTransmission {
    Automatic = 200,
    Manual = 300
}

interface MotorCycle {
    vType: "motorcycle";
    make: number;
}

interface Car {
    vType: "car";
    transmission: CarTransmission;
}

interface Truck {
    vType: "truck";
    capacity: number;
}

type Vehicle = MotorCycle | Car | Truck;

const EVALUATION_FACTOR = Math.PI;

function evaluatePrice(vehicle: Vehicle) {
    switch (vehicle.vType) {
        case "car":
            return vehicle.transmission * EVALUATION_FACTOR;
        case "truck":
            return vehicle.capacity * EVALUATION_FACTOR;
        case "motorcycle":
            return vehicle.make * EVALUATION_FACTOR;
    }
}

const myTruck: Truck = { vType: "truck", capacity: 9.5 };
evaluatePrice(myTruck);

type PartialPointX = { x: number; };
type Point = PartialPointX & { y: number; };

let point: Point = {
    x: 1,
    y: 1
}

interface X {
    c: string;
    d: string;
}

interface Y {
    c: number;
    e: string;
}

type XY = X & Y;
type YX = Y & X;

let p: XY;
let q: YX;

p = { c: 6, d: "d", e: "e"}; // string & numbet -> never
q = { c: "c", d: "d", e: "e"};

interface D { d: boolean; }
interface E { e: string; }
interface F { f: number; }

interface A { x: D; }
interface B { x: E; }
interface C { x: F; }

type ABC = A & B & C;

let abc: ABC = {
    x: { // OK
        d: true,
        e: "hello",
        f: 666
    }
}
