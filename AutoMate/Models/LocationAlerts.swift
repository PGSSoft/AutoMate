// swiftlint:disable variable_name trailing_comma
/// Represents possible location service messages and label values on buttons.

import XCTest

extension LocationAlertCancel {
    public static var cancel: [String] {
        return [
            "Annuler",
            "Скасувати",
            "Batalkan",
            "Batal",
            "Mégsem",
            "إلغاء",
            "ביטול",
            "Anuluj",
            "Hủy",
            "取消",
            "Zrušit",
            "Vazgeç",
            "キャンセル",
            "Cancel·lar",
            "Kumoa",
            "रद्द करें",
            "ยกเลิก",
            "Отменить",
            "Annuller",
            "Cancel",
            "Annuleer",
            "Poništi",
            "Avbryt",
            "Ακύρωση",
            "Anulați",
            "취소",
            "Cancelar",
            "Zrušiť",
            "Abbrechen",
            "Annulla",
        ]
    }
}

extension LocationAlertOk {
    public static var ok: [String] {
        return [
            "ОК",
            "Tamam",
            "ΟΚ",
            "확인",
            "אישור",
            "OKE",
            "OK",
            "ตกลง",
            "موافق",
            "好",
            "ठीक",
        ]
    }
}

extension LocationAlertDeny {
    public static var deny: [String] {
        return [
            "ไม่อนุญาต",
            "No permetre",
            "Заборонити",
            "عدم السماح",
            "Ikke tillat",
            "No permitir",
            "不允许",
            "許可しない",
            "Nepovoliť",
            "Άρνηση",
            "Nu permiteți",
            "אל תאפשר",
            "Não permitir",
            "Jangan Benarkan",
            "Nie pozwalaj",
            "Tidak Boleh",
            "Non consentire",
            "Don’t Allow",
            "不允許",
            "İzin Verme",
            "Sta niet toe",
            "Nemoj dozvoliti",
            "Zakázat",
            "허용 안 함",
            "Tillåt inte",
            "Tillad ikke",
            "Älä salli",
            "Từ chối",
            "Tiltás",
            "अनुमति न दें",
            "Não Permitir",
            "Запретить",
            "Refuser",
            "Nein",
        ]
    }
}

extension LocationAlertAllow {
    public static var allow: [String] {
        return [
            "Salli",
            "허용",
            "允许",
            "Tillåt",
            "Permetre",
            "Izinkan",
            "السماح",
            "Povoliť",
            "Cho phép",
            "Allow",
            "Permiteți",
            "Autoriser",
            "Benarkan",
            "Permitir",
            "允許",
            "Sta toe",
            "Erlauben",
            "Pozwalaj",
            "अनुमति दें",
            "Tillat",
            "許可",
            "Дозволити",
            "Разрешить",
            "Tillad",
            "Engedélyezés",
            "İzin Ver",
            "อนุญาต",
            "Dozvoli",
            "Povolit",
            "אפשר",
            "Consenti",
            "Να επιτρέπεται",
        ]
    }
}

public struct LocationUpgradeWhenInUseAlwaysAlert: SystemAlert, LocationAlertAllow, LocationAlertCancel {
    public static let messages = [
        "Vill du tillåta att ”*” även ser din platsinfo när du inte använder appen?",
        "Udostępniać programowi „*” Twoje położenie także, gdy go nie używasz?",
        "Permitir que “*” também aceda à sua localização quando não está a usar a aplicação?",
        "‘*’을(를) 사용하지 않을 때에도 해당 앱이 사용자의 위치에 접근하도록 허용하곘습니까?",
        "允许“*”在您并未使用该应用时访问您的位置吗？",
        "Engedélyezi, hogy a(z) „*” hozzáférjen az Ön helyzetéhez akkor is, ha nem használja az alkalmazást?",
        "Chcete aplikaci * povolit přístup k polohovým údajům i v čase, kdy ji nepoužíváte?",
        "Cũng cho phép “*” truy cập vị trí của bạn ngay cả khi bạn không dùng ứng dụng?",
        "Dozvoliti aplikaciji “*” da pristupa vašoj lokaciji čak i kad ne koristite aplikaciju?",
        "Benarkan “*” turut mengakses lokasi anda walaupun anda tidak menggunakan aplikasi?",
        "Izinkan juga “*” untuk mengakses lokasi Anda bahkan saat Anda tidak menggunakan app?",
        "¿Permitir a * acceder también a tu ubicación aunque no estés utilizando la aplicación?",
        "อนุญาตให้ “*” เข้าถึงตำแหน่งที่ตั้งของคุณด้วยแม้ว่าคุณจะไม่ได้ใช้แอพอยู่หรือไม่",
        "Autoriser « * » à accéder aussi à vos données de localisation même si vous n’utilisez pas l’app?",
        "Дозволити «*» також отримувати ваше місце, навіть коли програма не використовуєтьcя?",
        "Sallitko, että * käyttää sijaintiasi myös silloin, kun et käytä appia?",
        "Permitir que “*” também tenha acesso à sua localização mesmo quando você não estiver usando o aplicativo?",
        "Autoriser « * » à accéder aussi à vos données de localisation lorsque vous n’utilisez pas l’app ?",
        "לאפשר גם ל-״*״ לגשת לפרטי מיקומך אפילו כשאינך משתמש/ת ביישום?",
        "ऐप के उपयोग में न होने के दौरान भी “*” को अपने स्थान का उपयोग करने की अनुमति दें?",
        "Consenti a “*” di accedere anche ai dati relativi alla tua posizione quando l'app non è in uso?",
        "Vil du også gi «*» tilgang til plasseringen din selv når du ikke bruker appen?",
        "Wil je * zelfs toegang tot je locatie toestaan als je de app niet gebruikt?",
        "Permiteți ca aplicația “*” să acceseze, de asemenea, localizarea dvs. chiar și atunci când nu o utilizați?",
        "Allow “*” to also access your location even when you are not using the app?",
        "Chcete povoliť aplikácii „*“ pristupovať k vašej polohe aj v čase, keď ju nepoužívate?",
        "السماح لـ \"*\" أيضًا بالوصول إلى الموقع الخاص بك حتى عند عدم استخدامك للتطبيق؟",
        "Permets que “*” també accedeixi a la teva ubicació encara que no estiguis utilitzant l’aplicació?",
        "“*”, uygulamayı kullanmıyorken bile konumunuza da erişebilsin mi?",
        "Να επιτρέπεται επίσης στην εφαρμογή «*» η πρόσβαση στην τοποθεσία σας ακόμη κι όταν δεν χρησιμοποιείτε την εφαρμογή;",
        "Må “*” også få adgang til din lokalitet, når du ikke bruger appen?",
        "Darf „*“ auch auf deinen Standort zugreifen, wenn du die App nicht benutzt?",
        "要允許「*」在你並非使用 App 時也能取用你的位置嗎？",
        "Разрешить программе «*» доступ к Вашей геопозиции, даже когда Вы не работаете с этой программой?",
        "要允許「*」在您未使用 App 時也可取用您的位置嗎？",
        "“*”を使用していないときでも位置情報の利用を許可しますか?",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.staticTexts.elements(withLabelsLike: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct LocationAlwaysAlert: SystemAlert, LocationAlertAllow, LocationAlertDeny {
    public static let messages = [
        "要允許「*」在您未使用 App 時也可取用您的位置嗎？",
        "Udostępniać programowi „*” Twoje położenie także, gdy go nie używasz?",
        "Wil je * toegang tot je locatie toestaan, zelfs als je de app niet gebruikt?",
        "Må “*” bruge din lokalitet, også når du ikke bruger appen?",
        "允许“*”在您并未使用该应用时访问您的位置吗？",
        "السماح لـ \"*\" بالوصول إلى الموقع الخاص بك حتى عند عدم استخدامك للتطبيق؟",
        "Cho phép “*” truy cập vị trí của bạn ngay cả khi bạn không dùng ứng dụng?",
        "Engedélyezi, hogy a(z) „*” hozzáférjen az Ön helyzetéhez akkor is, ha nem használja az alkalmazást?",
        "Chcete aplikaci * povolit přístup k polohovým údajům i v čase, kdy ji nepoužíváte?",
        "Dozvoliti aplikaciji “*” pristup vašoj lokaciji čak i kad ne koristite aplikaciju?",
        "Permitir que “*” tenha acesso à sua localização mesmo quando você não estiver usando o aplicativo?",
        "이 앱을 사용하지 않을 때에도 ‘*’이(가) 사용자의 위치에 접근하도록 허용하겠습니까?",
        "Permets que “*” accedeixi a la teva ubicació encara que no estiguis utilitzant l’aplicació?",
        "Sallitko, että * käyttää sijaintiasi myös silloin, kun et käytä appia?",
        "Chcete povoliť aplikácii „*“ pristupovať k vašej polohe v čase, keď ju nepoužívate?",
        "Дозволити «*» отримувати ваше місце, навіть коли програма не використовуєтьcя?",
        "Να επιτρέπεται στην εφαρμογή «*» η πρόσβαση στην τοποθεσία σας ακόμη κι όταν δεν χρησιμοποιείτε την εφαρμογή;",
        "Darf „*“ auf deinen Standort zugreifen, selbst wenn du die App nicht benutzt?",
        "Allow “*” to access your location even when you are not using the app?",
        "Vill du tillåta ”*” att se din platsinfo även när du inte använder appen?",
        "Vil du gi «*» tilgang til plasseringen din også når du ikke bruker appen?",
        "Permiteți ca aplicația “*” să acceseze localizarea dvs. chiar și atunci când nu o utilizați?",
        "¿Permitir a * acceder a tu ubicación aunque no estés utilizando la aplicación?",
        "ऐप के न उपयोग होने के दौरान भी “*” को अपने वर्तमान स्थान का उपयोग करने दें?",
        "Permitir que “*” aceda à sua localização mesmo que não esteja a usar a aplicação?",
        "Izinkan “*” untuk mengakses lokasi Anda bahkan saat Anda tidak menggunakan app?",
        "Autoriser « * » à accéder à vos données de localisation même si vous n’utilisez pas l’app?",
        "要允許「*」在你並非使用 App 時也能取用你的位置嗎？",
        "Разрешить программе «*» доступ к Вашей геопозиции, даже когда Вы не работаете с этой программой?",
        "“*”, uygulamayı kullanmıyorken bile konumunuza erişebilsin mi?",
        "לאפשר ל-״*״ לגשת לפרטי מיקומך גם כשאינך משתמש/ת ביישום?",
        "Benarkan “*” mengakses lokasi anda walaupun anda tidak menggunakan aplikasi?",
        "Autoriser « * » à accéder à vos données de localisation même lorsque vous n’utilisez pas l’app ?",
        "Consenti a “*” di accedere ai dati relativi alla tua posizione anche quando non stai usando l'app?",
        "อนุญาตให้ “*” เข้าถึงตำแหน่งที่ตั้งของคุณแม้ว่าคุณจะไม่ได้ใช้แอพอยู่หรือไม่",
        "“*”を使用していないときでも位置情報の利用を許可しますか?",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.staticTexts.elements(withLabelsLike: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct LocationWhenInUseAlert: SystemAlert, LocationAlertAllow, LocationAlertDeny {
    public static let messages = [
        "Allow “*” to access your location while you use the app?",
        "Wil je * toegang tot je locatie toestaan terwijl je de app gebruikt?",
        "“*”, uygulamayı kullanırken konumunuza erişebilsin mi?",
        "Benarkan “*” mengakses lokasi anda semasa anda menggunakan aplikasi?",
        "ऐप के उपयोग होने के दौरान “*” को अपने वर्तमान स्थान का उपयोग करने दें?",
        "Разрешить программе «*» доступ к Вашей геопозиции, пока Вы работаете с этой программой?",
        "Darf „*“ auf deinen Standort zugreifen, wenn du die App benutzt?",
        "允许“*”在您使用该应用时访问您的位置吗？",
        "Dozvoliti aplikaciji “*” pristup vašoj lokaciji dok koristite aplikaciju?",
        "Permitir que “*” aceda à sua localização enquanto usa a aplicação?",
        "Vil du gi «*» tilgang til plasseringen din når du bruker appen?",
        "Udostępniać programowi „*” Twoje położenie, gdy go używasz?",
        "อนุญาตให้ “*” เข้าถึงตำแหน่งที่ตั้งของคุณระหว่างที่คุณใช้แอพหรือไม่",
        "Consenti a “*” di accedere ai dati relativi alla tua posizione quando stai usando l'app?",
        "Permiteți ca aplicația “*” să acceseze localizarea dvs. în timp ce o utilizați?",
        "السماح لـ \"*\" بالوصول إلى الموقع الخاص بك عند استخدامك للتطبيق؟",
        "Permitir que “*” tenha acesso à sua localização enquanto você usa o aplicativo?",
        "Permets que “*” accedeixi a la teva ubicació mentre utilitzes l’aplicació?",
        "앱을 사용하는 동안 ‘*’에서 사용자의 위치에 접근하도록 허용하겠습니까?",
        "Chcete povoliť aplikácii „*“ pristupovať k vašej polohe v čase, keď ju používate?",
        "¿Permitir a * acceder a tu ubicación mientras utilizas la aplicación?",
        "Cho phép “*” truy cập vị trí của bạn khi bạn dùng ứng dụng?",
        "Autoriser « * » à accéder à vos données de localisation lorsque vous utilisez l’app ?",
        "Vill du tillåta ”*” att se din platsinfo när du använder appen?",
        "A(z) „*” hozzáférhet a helyzetéhez az alkalmazás használatakor?",
        "“*”の使用中に位置情報の利用を許可しますか?",
        "לאפשר ל-״*״ לגשת לפרטי מיקומך בעת שימושך ביישום?",
        "Chcete aplikaci * povolit přístup k polohovým údajům v čase, kdy ji používáte?",
        "Izinkan “*” untuk mengakses lokasi Anda saat Anda menggunakan app?",
        "Må “*” bruge din lokalitet, når du bruger appen?",
        "Sallitko, että * käyttää sijaintiasi silloin, kun käytät appia?",
        "Дозволити «*» отримувати ваше місце, коли ви використовуєте програму?",
        "要允許「*」在您使用 App 時取用您的位置嗎？",
        "要允許「*」在你正在使用 App 時取用你的位置嗎？",
        "Να επιτρέπεται στην εφαρμογή «*» η πρόσβαση στην τοποθεσία σας κατά τη χρήση της;",
        "Autoriser « * » à accéder à vos données de localisation lorsque vous utilisez cette app?",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.staticTexts.elements(withLabelsLike: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}
