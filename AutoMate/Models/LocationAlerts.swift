// swiftlint:disable variable_name type_body_length trailing_comma file_length line_length
/// Represents possible location service messages and label values on buttons.

import XCTest

extension LocationAlertAllow {

    /// Represents all possible "allow" buttons in location service messages.
    public static var allow: [String] {
        return [
            "Allow",
            "Autoriser",
            "Benarkan",
            "Cho phép",
            "Consenti",
            "Dozvoli",
            "Engedélyezés",
            "Erlauben",
            "Izinkan",
            "İzin Ver",
            "Permetre",
            "Permiteți",
            "Permitir",
            "Povolit",
            "Povoliť",
            "Pozwalaj",
            "Salli",
            "Sta toe",
            "Tillad",
            "Tillat",
            "Tillåt",
            "Να επιτρέπεται",
            "Дозволити",
            "Разрешить",
            "אפשר",
            "السماح",
            "अनुमति दें",
            "อนุญาต",
            "허용",
            "允許",
            "允许",
            "許可",
        ]
    }
}

extension LocationAlertCancel {

    /// Represents all possible "cancel" buttons in location service messages.
    public static var cancel: [String] {
        return [
            "Abbrechen",
            "Annuleer",
            "Annuler",
            "Annulla",
            "Annuller",
            "Anulați",
            "Anuluj",
            "Avbryt",
            "Batal",
            "Batalkan",
            "Cancel",
            "Cancelar",
            "Cancel·lar",
            "Hủy",
            "Kumoa",
            "Mégsem",
            "Poništi",
            "Vazgeç",
            "Zrušit",
            "Zrušiť",
            "Ακύρωση",
            "Отменить",
            "Скасувати",
            "ביטול",
            "إلغاء",
            "रद्द करें",
            "ยกเลิก",
            "취소",
            "キャンセル",
            "取消",
        ]
    }
}

extension LocationAlertDeny {

    /// Represents all possible "deny" buttons in location service messages.
    public static var deny: [String] {
        return [
            "Älä salli",
            "Don’t Allow",
            "Ikke tillat",
            "İzin Verme",
            "Jangan Benarkan",
            "Não Permitir",
            "Não permitir",
            "Nein",
            "Nemoj dozvoliti",
            "Nepovoliť",
            "Nie pozwalaj",
            "No permetre",
            "No permitir",
            "Non consentire",
            "Nu permiteți",
            "Refuser",
            "Sta niet toe",
            "Tidak Boleh",
            "Tillad ikke",
            "Tillåt inte",
            "Tiltás",
            "Từ chối",
            "Zakázat",
            "Άρνηση",
            "Заборонити",
            "Запретить",
            "אל תאפשר",
            "عدم السماح",
            "अनुमति न दें",
            "ไม่อนุญาต",
            "허용 안 함",
            "不允許",
            "不允许",
            "許可しない",
        ]
    }
}

extension LocationAlertOk {

    /// Represents all possible "ok" buttons in location service messages.
    public static var ok: [String] {
        return [
            "OK",
            "OKE",
            "Tamam",
            "ΟΚ",
            "ОК",
            "אישור",
            "موافق",
            "ठीक",
            "ตกลง",
            "확인",
            "好",
        ]
    }
}

/// Represents LocationAlwaysAlert service alert.
public struct LocationAlwaysAlert: SystemAlert, LocationAlertAllow, LocationAlertDeny {

    /// Represents all possible messages in LocationAlwaysAlert service alert.
    public static let messages = [
        "Allow “*” to access your location even when you are not using the app?",
        "Autoriser « * » à accéder à vos données de localisation même lorsque vous n’utilisez pas l’app ?",
        "Autoriser « * » à accéder à vos données de localisation même si vous n’utilisez pas l’app?",
        "Benarkan “*” mengakses lokasi anda walaupun anda tidak menggunakan aplikasi?",
        "Chcete aplikaci * povolit přístup k polohovým údajům i v čase, kdy ji nepoužíváte?",
        "Chcete povoliť aplikácii „*“ pristupovať k vašej polohe v čase, keď ju nepoužívate?",
        "Cho phép “*” truy cập vị trí của bạn ngay cả khi bạn không dùng ứng dụng?",
        "Consenti a “*” di accedere ai dati relativi alla tua posizione anche quando non stai usando l'app?",
        "Darf „*“ auf deinen Standort zugreifen, selbst wenn du die App nicht benutzt?",
        "Dozvoliti aplikaciji “*” pristup vašoj lokaciji čak i kad ne koristite aplikaciju?",
        "Engedélyezi, hogy a(z) „*” hozzáférjen az Ön helyzetéhez akkor is, ha nem használja az alkalmazást?",
        "Izinkan “*” untuk mengakses lokasi Anda bahkan saat Anda tidak menggunakan app?",
        "Må “*” bruge din lokalitet, også når du ikke bruger appen?",
        "Permets que “*” accedeixi a la teva ubicació encara que no estiguis utilitzant l’aplicació?",
        "Permiteți ca aplicația “*” să acceseze localizarea dvs. chiar și atunci când nu o utilizați?",
        "Permitir que “*” aceda à sua localização mesmo que não esteja a usar a aplicação?",
        "Permitir que “*” tenha acesso à sua localização mesmo quando você não estiver usando o aplicativo?",
        "Sallitko, että * käyttää sijaintiasi myös silloin, kun et käytä appia?",
        "Udostępniać programowi „*” Twoje położenie także, gdy go nie używasz?",
        "Vil du gi «*» tilgang til plasseringen din også når du ikke bruker appen?",
        "Vill du tillåta ”*” att se din platsinfo även när du inte använder appen?",
        "Wil je * toegang tot je locatie toestaan, zelfs als je de app niet gebruikt?",
        "¿Permitir a * acceder a tu ubicación aunque no estés utilizando la aplicación?",
        "Να επιτρέπεται στην εφαρμογή «*» η πρόσβαση στην τοποθεσία σας ακόμη κι όταν δεν χρησιμοποιείτε την εφαρμογή;",
        "Дозволити «*» отримувати ваше місце, навіть коли програма не використовуєтьcя?",
        "Разрешить программе «*» доступ к Вашей геопозиции, даже когда Вы не работаете с этой программой?",
        "לאפשר ל-״*״ לגשת לפרטי מיקומך גם כשאינך משתמש/ת ביישום?",
        "السماح لـ \"*\" بالوصول إلى الموقع الخاص بك حتى عند عدم استخدامك للتطبيق؟",
        "ऐप के न उपयोग होने के दौरान भी “*” को अपने वर्तमान स्थान का उपयोग करने दें?",
        "อนุญาตให้ “*” เข้าถึงตำแหน่งที่ตั้งของคุณแม้ว่าคุณจะไม่ได้ใช้แอพอยู่หรือไม่",
        "이 앱을 사용하지 않을 때에도 ‘*’이(가) 사용자의 위치에 접근하도록 허용하겠습니까?",
        "“*”, uygulamayı kullanmıyorken bile konumunuza erişebilsin mi?",
        "“*”を使用していないときでも位置情報の利用を許可しますか?",
        "允许“*”在您并未使用该应用时访问您的位置吗？",
        "要允許「*」在你並非使用 App 時也能取用你的位置嗎？",
        "要允許「*」在您未使用 App 時也可取用您的位置嗎？",
    ]

    /// System service alert element.
    public var alert: XCUIElement

    /// Initialize LocationAlwaysAlert with alert element.
    ///
    /// - Parameter element: An alert element.
    public init?(element: XCUIElement) {
        guard let _ = element.staticTexts.elements(withLabelsLike: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

/// Represents LocationUpgradeWhenInUseAlwaysAlert service alert.
public struct LocationUpgradeWhenInUseAlwaysAlert: SystemAlert, LocationAlertAllow, LocationAlertCancel {

    /// Represents all possible messages in LocationUpgradeWhenInUseAlwaysAlert service alert.
    public static let messages = [
        "Allow “*” to also access your location even when you are not using the app?",
        "Autoriser « * » à accéder aussi à vos données de localisation lorsque vous n’utilisez pas l’app ?",
        "Autoriser « * » à accéder aussi à vos données de localisation même si vous n’utilisez pas l’app?",
        "Benarkan “*” turut mengakses lokasi anda walaupun anda tidak menggunakan aplikasi?",
        "Chcete aplikaci * povolit přístup k polohovým údajům i v čase, kdy ji nepoužíváte?",
        "Chcete povoliť aplikácii „*“ pristupovať k vašej polohe aj v čase, keď ju nepoužívate?",
        "Consenti a “*” di accedere anche ai dati relativi alla tua posizione quando l'app non è in uso?",
        "Cũng cho phép “*” truy cập vị trí của bạn ngay cả khi bạn không dùng ứng dụng?",
        "Darf „*“ auch auf deinen Standort zugreifen, wenn du die App nicht benutzt?",
        "Dozvoliti aplikaciji “*” da pristupa vašoj lokaciji čak i kad ne koristite aplikaciju?",
        "Engedélyezi, hogy a(z) „*” hozzáférjen az Ön helyzetéhez akkor is, ha nem használja az alkalmazást?",
        "Izinkan juga “*” untuk mengakses lokasi Anda bahkan saat Anda tidak menggunakan app?",
        "Må “*” også få adgang til din lokalitet, når du ikke bruger appen?",
        "Permets que “*” també accedeixi a la teva ubicació encara que no estiguis utilitzant l’aplicació?",
        "Permiteți ca aplicația “*” să acceseze, de asemenea, localizarea dvs. chiar și atunci când nu o utilizați?",
        "Permitir que “*” também aceda à sua localização quando não está a usar a aplicação?",
        "Permitir que “*” também tenha acesso à sua localização mesmo quando você não estiver usando o aplicativo?",
        "Sallitko, että * käyttää sijaintiasi myös silloin, kun et käytä appia?",
        "Udostępniać programowi „*” Twoje położenie także, gdy go nie używasz?",
        "Vil du også gi «*» tilgang til plasseringen din selv når du ikke bruker appen?",
        "Vill du tillåta att ”*” även ser din platsinfo när du inte använder appen?",
        "Wil je * zelfs toegang tot je locatie toestaan als je de app niet gebruikt?",
        "¿Permitir a * acceder también a tu ubicación aunque no estés utilizando la aplicación?",
        "Να επιτρέπεται επίσης στην εφαρμογή «*» η πρόσβαση στην τοποθεσία σας ακόμη κι όταν δεν χρησιμοποιείτε την εφαρμογή;",
        "Дозволити «*» також отримувати ваше місце, навіть коли програма не використовуєтьcя?",
        "Разрешить программе «*» доступ к Вашей геопозиции, даже когда Вы не работаете с этой программой?",
        "לאפשר גם ל-״*״ לגשת לפרטי מיקומך אפילו כשאינך משתמש/ת ביישום?",
        "السماح لـ \"*\" أيضًا بالوصول إلى الموقع الخاص بك حتى عند عدم استخدامك للتطبيق؟",
        "ऐप के उपयोग में न होने के दौरान भी “*” को अपने स्थान का उपयोग करने की अनुमति दें?",
        "อนุญาตให้ “*” เข้าถึงตำแหน่งที่ตั้งของคุณด้วยแม้ว่าคุณจะไม่ได้ใช้แอพอยู่หรือไม่",
        "‘*’을(를) 사용하지 않을 때에도 해당 앱이 사용자의 위치에 접근하도록 허용하곘습니까?",
        "“*”, uygulamayı kullanmıyorken bile konumunuza da erişebilsin mi?",
        "“*”を使用していないときでも位置情報の利用を許可しますか?",
        "允许“*”在您并未使用该应用时访问您的位置吗？",
        "要允許「*」在你並非使用 App 時也能取用你的位置嗎？",
        "要允許「*」在您未使用 App 時也可取用您的位置嗎？",
    ]

    /// System service alert element.
    public var alert: XCUIElement

    /// Initialize LocationUpgradeWhenInUseAlwaysAlert with alert element.
    ///
    /// - Parameter element: An alert element.
    public init?(element: XCUIElement) {
        guard let _ = element.staticTexts.elements(withLabelsLike: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

/// Represents LocationWhenInUseAlert service alert.
public struct LocationWhenInUseAlert: SystemAlert, LocationAlertAllow, LocationAlertDeny {

    /// Represents all possible messages in LocationWhenInUseAlert service alert.
    public static let messages = [
        "A(z) „*” hozzáférhet a helyzetéhez az alkalmazás használatakor?",
        "Allow “*” to access your location while you use the app?",
        "Autoriser « * » à accéder à vos données de localisation lorsque vous utilisez cette app?",
        "Autoriser « * » à accéder à vos données de localisation lorsque vous utilisez l’app ?",
        "Benarkan “*” mengakses lokasi anda semasa anda menggunakan aplikasi?",
        "Chcete aplikaci * povolit přístup k polohovým údajům v čase, kdy ji používáte?",
        "Chcete povoliť aplikácii „*“ pristupovať k vašej polohe v čase, keď ju používate?",
        "Cho phép “*” truy cập vị trí của bạn khi bạn dùng ứng dụng?",
        "Consenti a “*” di accedere ai dati relativi alla tua posizione quando stai usando l'app?",
        "Darf „*“ auf deinen Standort zugreifen, wenn du die App benutzt?",
        "Dozvoliti aplikaciji “*” pristup vašoj lokaciji dok koristite aplikaciju?",
        "Izinkan “*” untuk mengakses lokasi Anda saat Anda menggunakan app?",
        "Må “*” bruge din lokalitet, når du bruger appen?",
        "Permets que “*” accedeixi a la teva ubicació mentre utilitzes l’aplicació?",
        "Permiteți ca aplicația “*” să acceseze localizarea dvs. în timp ce o utilizați?",
        "Permitir que “*” aceda à sua localização enquanto usa a aplicação?",
        "Permitir que “*” tenha acesso à sua localização enquanto você usa o aplicativo?",
        "Sallitko, että * käyttää sijaintiasi silloin, kun käytät appia?",
        "Udostępniać programowi „*” Twoje położenie, gdy go używasz?",
        "Vil du gi «*» tilgang til plasseringen din når du bruker appen?",
        "Vill du tillåta ”*” att se din platsinfo när du använder appen?",
        "Wil je * toegang tot je locatie toestaan terwijl je de app gebruikt?",
        "¿Permitir a * acceder a tu ubicación mientras utilizas la aplicación?",
        "Να επιτρέπεται στην εφαρμογή «*» η πρόσβαση στην τοποθεσία σας κατά τη χρήση της;",
        "Дозволити «*» отримувати ваше місце, коли ви використовуєте програму?",
        "Разрешить программе «*» доступ к Вашей геопозиции, пока Вы работаете с этой программой?",
        "לאפשר ל-״*״ לגשת לפרטי מיקומך בעת שימושך ביישום?",
        "السماح لـ \"*\" بالوصول إلى الموقع الخاص بك عند استخدامك للتطبيق؟",
        "ऐप के उपयोग होने के दौरान “*” को अपने वर्तमान स्थान का उपयोग करने दें?",
        "อนุญาตให้ “*” เข้าถึงตำแหน่งที่ตั้งของคุณระหว่างที่คุณใช้แอพหรือไม่",
        "앱을 사용하는 동안 ‘*’에서 사용자의 위치에 접근하도록 허용하겠습니까?",
        "“*”, uygulamayı kullanırken konumunuza erişebilsin mi?",
        "“*”の使用中に位置情報の利用を許可しますか?",
        "允许“*”在您使用该应用时访问您的位置吗？",
        "要允許「*」在你正在使用 App 時取用你的位置嗎？",
        "要允許「*」在您使用 App 時取用您的位置嗎？",
    ]

    /// System service alert element.
    public var alert: XCUIElement

    /// Initialize LocationWhenInUseAlert with alert element.
    ///
    /// - Parameter element: An alert element.
    public init?(element: XCUIElement) {
        guard let _ = element.staticTexts.elements(withLabelsLike: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}
