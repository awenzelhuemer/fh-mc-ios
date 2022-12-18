import Cocoa

var greeting = "Hello, playground"

func download(method: (String) -> ()) {
    let result = "finished"
    method(result)
}

download { result in
    print(result)
}

download { (result: String) in
    return print(result)
}
