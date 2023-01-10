//
// Created by Andreas Wenzelhuemer on 10.01.23.
//

import Foundation

struct ApiError: Error {
    private let message: String

    init(_ message: String) {
        self.message = message
    }

    public var localizedDescription: String {
        message
    }
}
