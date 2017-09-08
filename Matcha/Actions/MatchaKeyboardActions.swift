
import UIKit
import Foundation
import EarlGrey

public protocol MatchaKeyboardActions: EarlGreyHumanizer {
    
    func tapKeyboardReturnKey(file: StaticString, line: UInt)
}

public extension MatchaKeyboardActions {
    
    func tapKeyboardReturnKey(file: StaticString = #file, line: UInt = #line) {
        
        let matchers: Matcher = .allOf(
            [
                .firstResponder,
                .class(UITextField.self)
            ]
        )
        let newLineCharacter = "\n"

        select(
            matchers, file: file, line: line
        ).perform(
            grey_typeText(newLineCharacter)
        )
    }
}
