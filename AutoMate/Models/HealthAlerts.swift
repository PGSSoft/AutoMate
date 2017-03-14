// swiftlint:disable variable_name type_body_length trailing_comma file_length line_length
/// Represents possible health service messages and label values on buttons.

import XCTest

extension HealthAlertAllow {

    /// Represents all possible "allow" buttons in HealthKit permission view.
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
            "Pozwól",
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

extension HealthAlertDeny {

    /// Represents all possible "deny" buttons in HealthKit permission view.
    public static var deny: [String] {
        return [
            "Älä salli",
            "Don't Allow",
            "Ikke tillat",
            "İzin Verme",
            "Jangan Benarkan",
            "Jangan Izinkan",
            "Não Permitir",
            "Não permitir",
            "Nemoj dozvoliti",
            "Nepovoliť",
            "Nicht erlauben",
            "Nie pozwalaj",
            "No permetre",
            "No permitir",
            "Non consentire",
            "Nu permiteți",
            "Refuser",
            "Tillad ikke",
            "Tillåt inte",
            "Tiltás",
            "Từ chối",
            "Weiger",
            "Zakázat",
            "Να μην επιτρέπεται",
            "Заборонити",
            "Не разрешать",
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

extension HealthAlertOk {

    /// Represents all possible "ok" buttons in HealthKit permission view.
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

extension HealthAlertTurnOffAll {

    /// Represents all possible "turnOffAll" buttons in HealthKit permission view.
    public static var turnOffAll: [String] {
        return [
            "Alle Kategorien deaktivieren",
            "Desactivar todas las categorías",
            "Desactivar totes les categories",
            "Desativar Todas as Categorias",
            "Desativar todas as categorias",
            "Dezactivați toate categoriile",
            "Désactiver toutes les catégories",
            "Disattiva tutte le categorie",
            "Isključi sve kategorije",
            "Laita kaikki kategoriat pois",
            "Matikan Semua Kategori",
            "Minden kategória kikapcsolása",
            "Nyahaktifkan Semua Kategori",
            "Schakel alle categorieën uit",
            "Slå alle kategorier fra",
            "Slå av alle kategorier",
            "Stäng av alla kategorier",
            "Tắt Tất cả Danh mục",
            "Turn All Categories Off",
            "Tüm Kategorileri Kapat",
            "Vypnout všechny kategorie",
            "Vypnúť všetky kategórie",
            "Wyłącz wszystkie kategorie",
            "Απενεργοποίηση των κατηγοριών",
            "Вимкнути всі категорії",
            "Отключить все категории",
            "בטל את כל הקטגוריות",
            "إيقاف كل الفئات",
            "सभी श्रेणियाँ बंद करें",
            "ปิดหมวดหมู่ทั้งหมด",
            "모든 카테고리 끄기",
            "すべてのカテゴリをオフ",
            "关闭所有类别",
            "關閉所有類別",
        ]
    }
}

extension HealthAlertTurnOnAll {

    /// Represents all possible "turnOnAll" buttons in HealthKit permission view.
    public static var turnOnAll: [String] {
        return [
            "Activar todas las categorías",
            "Activar totes les categories",
            "Activați toate categoriile",
            "Activer toutes les catégories",
            "Aktifkan Semua Kategori",
            "Alle Kategorien aktivieren",
            "Ativar Todas as Categorias",
            "Ativar todas as categorias",
            "Attiva tutte le categorie",
            "Bật Tất cả Danh mục",
            "Laita kaikki kategoriat päälle",
            "Minden kategória bekapcsolása",
            "Nyalakan Semua Kategori",
            "Schakel alle categorieën in",
            "Slå alle kategorier til",
            "Slå på alla kategorier",
            "Slå på alle kategorier",
            "Turn All Categories On",
            "Tüm Kategorileri Aç",
            "Uključi sve kategorije",
            "Włącz wszystkie kategorie",
            "Zapnout všechny kategorie",
            "Zapnúť všetky kategórie",
            "Ενεργοποίηση όλων των κατηγοριών",
            "Включить все категории",
            "Увімкнути всі категорії",
            "הפעל את כל הקטגוריות",
            "تشغيل كل الفئات",
            "सभी श्रेणियाँ चालू करें",
            "เปิดหมวดหมู่ทั้งหมด",
            "모든 카테고리 켜기",
            "すべてのカテゴリをオン",
            "打开所有类别",
            "開啟所有類別",
        ]
    }
}

public extension HealthPermissionPage {

    /// Represents all possible messages in HealthKit permission view.
    public static let messages = [
        "'*' wil toegang tot je gegevens en toestemming om deze te bewerken voor de onderstaande categorieën.",
        "* haluaa käyttää ja päivittää terveystietojasi alla olevissa kategorioissa.",
        "* quiere acceder a tus datos de salud y actualizarlos en las siguientes categorías.",
        "A(z) „*” hozzá akar férni és frissíteni akarja az Ön egészségügyi adatait az alábbi kategóriákban.",
        "Aplikace „*“ žádá o povolení k přístupu a aktualizaci zdravotních dat v níže uvedených kategoriích.",
        "Aplikácia „*“ chce získať prístup k vašim zdravotným dátam v nižšie uvedených kategóriách a aktualizovať ich.",
        "«*» vil ha tilgang til og oppdatere helsedataene dine i kategoriene nedenfor.",
        "«*» запрашивает разрешение на обновление Ваших данных Здоровья в категориях, указанных ниже.",
        "«*» хоче відкрити і оновити ваші Меддані за наведеними нижче категоріями.",
        "« * » aimerait accéder à vos Données Santé des catégories ci-dessous et les mettre à jour.",
        "« * » souhaite accéder et mettre à jour vos données médicales des catégories suivantes.",
        "Αίτημα από «*» για πρόσβαση στα Ιατρικά δεδομένα σας και ενημέρωσή τους στις παρακάτω κατηγορίες.",
        "״*״ מבקש לגשת אל נתוני הבריאות שלך בקטגוריות הבאות ולעדכן אותם.",
        "يرغب \"*\" بالوصول وتحديث البيانات الصحية في الفئات أدناه.",
        "‘*’에서 아래 카테고리에 해당하는 사용자의 건강 데이터에 접근하여 업데이트하려고 합니다.",
        "“*” ar dori să acceseze și să actualizeze datele dvs. de sănătate din categoriile de mai jos.",
        "“*” deseja ter acesso e atualizar seus dados de Saúde nas categorias abaixo.",
        "“*” desidera accedere ai tuoi dati sanitari e aggiornarli per le seguenti categorie.",
        "“*” gostaria de aceder aos seus dados de saúde nas categorias abaixo para os atualizar.",
        "“*” ingin mengakses dan memperbarui data Kesehatan Anda di kategori di bawah.",
        "“*” mahu mengakses dan mengemas kini data Kesihatan anda dalam kategori di bawah.",
        "“*” muốn truy cập và cập nhật dữ liệu Sức khỏe của bạn trong các danh mục bên dưới.",
        "“*” vil have adgang til og opdatere dine sundhedsdata i kategorierne nedenfor.",
        "“*” vol accedir a les teves dades de salut de les categories de sota i actualitzar-les.",
        "“*” would like to access and update your Health data in the categories below.",
        "“*” želi pristupiti i ažurirati vaše zdravstvene podatke u niže navedenim kategorijama.",
        "“*” आपका स्वास्थ्य डेटा नीचे दी गई श्रेणियों में उपयोग और अपडेट करना चाहता है।",
        "“*” ต้องการที่จะเข้าถึงและอัพเดทข้อมูลสุขภาพของคุณในหมวดหมู่ทางด้านล่าง",
        "“*”, aşağıdaki kategorilerde bulunan Sağlık verilerinize erişmek ve bunları güncellemek istiyor.",
        "“*”が以下のカテゴリのヘルスケアデータのアクセスとアップデートを求めています。",
        "“*”想要访问并更新以下类别中的健康数据。",
        "”*” vill kunna läsa och uppdatera dina hälsodata i kategorierna nedan.",
        "„*“ möchte auf deine Gesundheitsdaten in den folgenden Kategorien zugreifen und sie aktualisieren.",
        "„*” chce mieć dostęp do Twoich danych zdrowotnych poniższych kategorii i uaktualniać je.",
        "「*」想要取用並更新您在下列類別中的「健康資料」。",
        "「*」要存取及更新你下列類別的「健康」資料。",
    ]
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
    public static let messages = [
        "Acces Sănătate",
        "Acceso a Salud",
        "Accesso dati Salute",
        "Accès à Santé",
        "Accès médical",
        "Accés a Salut",
        "Acesso a Saúde",
        "Acesso de Saúde",
        "Adgang til Sundhed",
        "Akses Kesehatan",
        "Akses Kesihatan",
        "Datenzugriff",
        "Dostęp do danych Zdrowia",
        "Egészségügyi hozzáférés",
        "Hälsoåtkomst",
        "Health Access",
        "Helsetilgang",
        "Pristup Zdravlju",
        "Prístup ku zdravotným dátam",
        "Přístup ke Zdraví",
        "Sağlık Erişimi",
        "Terveystietojen käyttö",
        "Toegang gezondheid",
        "Truy cập sức khỏe",
        "Πρόσβαση σε Υγεία",
        "Доступ (Здоровье)",
        "Доступ до «Здоров’я»",
        "גישה רפואית",
        "الوصول لصحتي",
        "स्वास्थ्य पहुँच",
        "การเข้าถึงสุขภาพ",
        "건강 접근",
        "「健康」存取",
        "ヘルスケアデータのアクセス",
        "健康資料取用",
        "访问健康数据",
    ]

    /// System service alert element.
    public var alert: XCUIElement

    /// Initialize `HealthAuthorizationDontAllowAlert` with alert element.
    ///
    /// - Parameter element: An alert element.
    public init?(element: XCUIElement) {
        guard let _ = element.staticTexts.elements(withLabelsLike: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}
