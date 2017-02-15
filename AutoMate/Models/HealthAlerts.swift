// swiftlint:disable variable_name trailing_comma
/// Represents possible health service messages and label values on buttons.

import XCTest

extension HealthAlertTurnOnAll {
    public static var turnOnAll: [String] {
        return [
            "Activați toate categoriile",
            "सभी श्रेणियाँ चालू करें",
            "모든 카테고리 켜기",
            "Slå alle kategorier til",
            "Schakel alle categorieën in",
            "Nyalakan Semua Kategori",
            "Activar todas las categorías",
            "הפעל את כל הקטגוריות",
            "Ativar todas as categorias",
            "開啟所有類別",
            "Aktifkan Semua Kategori",
            "Bật Tất cả Danh mục",
            "Activer toutes les catégories",
            "すべてのカテゴリをオン",
            "Zapnout všechny kategorie",
            "Slå på alle kategorier",
            "Activar totes les categories",
            "Ενεργοποίηση όλων των κατηγοριών",
            "Увімкнути всі категорії",
            "Tüm Kategorileri Aç",
            "تشغيل كل الفئات",
            "Laita kaikki kategoriat päälle",
            "Ativar Todas as Categorias",
            "เปิดหมวดหมู่ทั้งหมด",
            "Slå på alla kategorier",
            "Uključi sve kategorije",
            "打开所有类别",
            "Minden kategória bekapcsolása",
            "Włącz wszystkie kategorie",
            "Alle Kategorien aktivieren",
            "Attiva tutte le categorie",
            "Включить все категории",
            "Turn All Categories On",
            "Zapnúť všetky kategórie",
        ]
    }
}

extension HealthAlertTurnOffAll {
    public static var turnOffAll: [String] {
        return [
            "Slå av alle kategorier",
            "Turn All Categories Off",
            "Desactivar todas las categorías",
            "Vypnúť všetky kategórie",
            "Isključi sve kategorije",
            "בטל את כל הקטגוריות",
            "Dezactivați toate categoriile",
            "모든 카테고리 끄기",
            "Wyłącz wszystkie kategorie",
            "關閉所有類別",
            "Slå alle kategorier fra",
            "Desativar Todas as Categorias",
            "Schakel alle categorieën uit",
            "Vypnout všechny kategorie",
            "Desativar todas as categorias",
            "Stäng av alla kategorier",
            "ปิดหมวดหมู่ทั้งหมด",
            "关闭所有类别",
            "Απενεργοποίηση των κατηγοριών",
            "Désactiver toutes les catégories",
            "Alle Kategorien deaktivieren",
            "Minden kategória kikapcsolása",
            "Laita kaikki kategoriat pois",
            "إيقاف كل الفئات",
            "Tắt Tất cả Danh mục",
            "すべてのカテゴリをオフ",
            "Nyahaktifkan Semua Kategori",
            "Отключить все категории",
            "Tüm Kategorileri Kapat",
            "Вимкнути всі категорії",
            "Desactivar totes les categories",
            "सभी श्रेणियाँ बंद करें",
            "Disattiva tutte le categorie",
            "Matikan Semua Kategori",
        ]
    }
}

extension HealthAlertAllow {
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
            "अनुमति दें",
            "Tillat",
            "許可",
            "Дозволити",
            "Разрешить",
            "Tillad",
            "Engedélyezés",
            "Pozwól",
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

extension HealthAlertDeny {
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
            "Nu permiteți",
            "Не разрешать",
            "אל תאפשר",
            "Não permitir",
            "Να μην επιτρέπεται",
            "Jangan Benarkan",
            "Nie pozwalaj",
            "Non consentire",
            "不允許",
            "Don't Allow",
            "İzin Verme",
            "Nemoj dozvoliti",
            "Zakázat",
            "허용 안 함",
            "Jangan Izinkan",
            "Tillåt inte",
            "Tillad ikke",
            "Älä salli",
            "Từ chối",
            "Tiltás",
            "अनुमति न दें",
            "Weiger",
            "Nicht erlauben",
            "Refuser",
            "Não Permitir",
        ]
    }
}

public struct HealthAlert: SystemAlert, HealthAlertAllow, HealthAlertDeny, HealthAlertTurnOnAll, HealthAlertTurnOffAll {
    public static let messages = [
        "„*“ möchte auf deine Gesundheitsdaten in den folgenden Kategorien zugreifen und sie aktualisieren.",
        "“*” ingin mengakses dan memperbarui data Kesehatan Anda di kategori di bawah.",
        "“*” ar dori să acceseze și să actualizeze datele dvs. de sănătate din categoriile de mai jos.",
        "“*” gostaria de aceder aos seus dados de saúde nas categorias abaixo para os atualizar.",
        "“*” would like to access and update your Health data in the categories below.",
        "يرغب \"*\" بالوصول وتحديث البيانات الصحية في الفئات أدناه.",
        "“*”想要访问并更新以下类别中的健康数据。",
        "“*” vol accedir a les teves dades de salut de les categories de sota i actualitzar-les.",
        "A(z) „*” hozzá akar férni és frissíteni akarja az Ön egészségügyi adatait az alábbi kategóriákban.",
        "“*”が以下のカテゴリのヘルスケアデータのアクセスとアップデートを求めています。",
        "“*” mahu mengakses dan mengemas kini data Kesihatan anda dalam kategori di bawah.",
        "“*” आपका स्वास्थ्य डेटा नीचे दी गई श्रेणियों में उपयोग और अपडेट करना चाहता है।",
        "« * » aimerait accéder à vos Données Santé des catégories ci-dessous et les mettre à jour.",
        "״*״ מבקש לגשת אל נתוני הבריאות שלך בקטגוריות הבאות ולעדכן אותם.",
        "* haluaa käyttää ja päivittää terveystietojasi alla olevissa kategorioissa.",
        "'*' wil toegang tot je gegevens en toestemming om deze te bewerken voor de onderstaande categorieën.",
        "«*» запрашивает разрешение на обновление Ваших данных Здоровья в категориях, указанных ниже.",
        "Aplikácia „*“ chce získať prístup k vašim zdravotným dátam v nižšie uvedených kategóriách a aktualizovať ich.",
        "”*” vill kunna läsa och uppdatera dina hälsodata i kategorierna nedan.",
        "Αίτημα από «*» για πρόσβαση στα Ιατρικά δεδομένα σας και ενημέρωσή τους στις παρακάτω κατηγορίες.",
        "«*» хоче відкрити і оновити ваші Меддані за наведеними нижче категоріями.",
        "“*” želi pristupiti i ažurirati vaše zdravstvene podatke u niže navedenim kategorijama.",
        "“*” muốn truy cập và cập nhật dữ liệu Sức khỏe của bạn trong các danh mục bên dưới.",
        "‘*’에서 아래 카테고리에 해당하는 사용자의 건강 데이터에 접근하여 업데이트하려고 합니다.",
        "Aplikace „*“ žádá o povolení k přístupu a aktualizaci zdravotních dat v níže uvedených kategoriích.",
        "「*」想要取用並更新您在下列類別中的「健康資料」。",
        "« * » souhaite accéder et mettre à jour vos données médicales des catégories suivantes.",
        "«*» vil ha tilgang til og oppdatere helsedataene dine i kategoriene nedenfor.",
        "“*” deseja ter acesso e atualizar seus dados de Saúde nas categorias abaixo.",
        "„*” chce mieć dostęp do Twoich danych zdrowotnych poniższych kategorii i uaktualniać je.",
        "「*」要存取及更新你下列類別的「健康」資料。",
        "“*” vil have adgang til og opdatere dine sundhedsdata i kategorierne nedenfor.",
        "“*” ต้องการที่จะเข้าถึงและอัพเดทข้อมูลสุขภาพของคุณในหมวดหมู่ทางด้านล่าง",
        "“*”, aşağıdaki kategorilerde bulunan Sağlık verilerinize erişmek ve bunları güncellemek istiyor.",
        "“*” desidera accedere ai tuoi dati sanitari e aggiornarli per le seguenti categorie.",
        "* quiere acceder a tus datos de salud y actualizarlos en las siguientes categorías.",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.staticTexts.elements(withLabelsLike: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}
