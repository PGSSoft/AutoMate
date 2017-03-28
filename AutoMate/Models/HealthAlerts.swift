// swiftlint:disable identifier_name type_body_length trailing_comma file_length line_length
/// Represents possible health service messages and label values on buttons.

import XCTest

extension HealthAlertAllow {

    /// Represents all possible "allow" buttons in HealthKit permission view.
    public static var allow: [String] {
        guard let url = Bundle.autoMate.url(forResource: "HealthAlertAllow", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let json = (try? JSONSerialization.jsonObject(with: data)) as? [String: [String]] else {
            return []
        }
        return json.flatMap { $0.value }
    }
}

extension HealthAlertDeny {

    /// Represents all possible "deny" buttons in HealthKit permission view.
    public static var deny: [String] {
        guard let url = Bundle.autoMate.url(forResource: "HealthAlertDeny", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let json = (try? JSONSerialization.jsonObject(with: data)) as? [String: [String]] else {
            return []
        }
        return json.flatMap { $0.value }
    }
}

extension HealthAlertOk {

    /// Represents all possible "ok" buttons in HealthKit permission view.
    public static var ok: [String] {
        guard let url = Bundle.autoMate.url(forResource: "HealthAlertOk", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let json = (try? JSONSerialization.jsonObject(with: data)) as? [String: [String]] else {
            return []
        }
        return json.flatMap { $0.value }
    }
}

extension HealthAlertTurnOffAll {

    /// Represents all possible "turnOffAll" buttons in HealthKit permission view.
    public static var turnOffAll: [String] {
        guard let url = Bundle.autoMate.url(forResource: "HealthAlertTurnOffAll", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let json = (try? JSONSerialization.jsonObject(with: data)) as? [String: [String]] else {
            return []
        }
        return json.flatMap { $0.value }
    }
}

extension HealthAlertTurnOnAll {

    /// Represents all possible "turnOnAll" buttons in HealthKit permission view.
    public static var turnOnAll: [String] {
        guard let url = Bundle.autoMate.url(forResource: "HealthAlertTurnOnAll", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let json = (try? JSONSerialization.jsonObject(with: data)) as? [String: [String]] else {
            return []
        }
        return json.flatMap { $0.value }
    }
}

public extension HealthPermissionPage {

    /// Represents all possible messages in HealthKit permission view.
    public static var messages: [String] {
        guard let url = Bundle.autoMate.url(forResource: "HealthPermissionPage", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let json = (try? JSONSerialization.jsonObject(with: data)) as? [String: [String]] else {
            return []
        }
        return json.flatMap { $0.value }
    }
}

/// Represents `HealthAuthorizationDontAllowAlert` service alert.
///
/// System alert supposed to be used in the handler of the `XCTestCase.addUIInterruptionMonitor(withDescription:handler:)` method.
///
/// **Example:**
///
/// ```swift
/// let token = addUIInterruptionMonitor(withDescription: "Alert") { (alert) -> Bool in
///     guard let alert = HealthAuthorizationDontAllowAlert(element: alert) else {
///         XCTFail("Cannot create HealthAuthorizationDontAllowAlert object")
///         return false
///     }
///
///     alert.allowElement.tap()
///     return true
/// }
///
/// mainPage.goToPermissionsPageMenu()
/// // Interruption won't happen without some kind of action.
/// app.tap()
/// removeUIInterruptionMonitor(token)
/// ```
///
/// - note:
/// Handlers should return `true` if they handled the UI, `false` if they did not.
public struct HealthAuthorizationDontAllowAlert: SystemAlert, HealthAlertOk {

    /// Represents all possible messages in `HealthAuthorizationDontAllowAlert` service alert.
    public static var messages: [String] {
        guard let url = Bundle.autoMate.url(forResource: "HealthAuthorizationDontAllowAlert", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let json = (try? JSONSerialization.jsonObject(with: data)) as? [String: [String]] else {
            return []
        }
        return json.flatMap { $0.value }
    }

    /// System service alert element.
    public var alert: XCUIElement

    /// Initialize `HealthAuthorizationDontAllowAlert` with alert element.
    ///
    /// - Parameter element: An alert element.
    public init?(element: XCUIElement) {
        guard element.staticTexts.elements(withLabelsLike: type(of: self).messages).first != nil else {
            return nil
        }

        self.alert = element
    }
}
