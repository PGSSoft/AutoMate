// swiftlint:disable variable_name trailing_comma file_length line_length
/// Represents possible system service messages and label values on buttons.

import XCTest

extension SystemAlertAllow {
    public static var allow: [String] {
        return [
            "OK",
            "OKE",
            "Permitir",
            "Tamam",
            "ОК",
            "Разрешить",
            "אישור",
            "موافق",
            "ठीक",
            "ตกลง",
            "승인",
            "好",
        ]
    }
}

extension SystemAlertDeny {
    public static var deny: [String] {
        return [
            "Älä salli",
            "Don’t Allow",
            "Ikke tillat",
            "İzin Verme",
            "Jangan Benarkan",
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
            "Tidak Boleh",
            "Tillad ikke",
            "Tillåt inte",
            "Tiltás",
            "Từ chối",
            "Weiger",
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

public struct AddressBookAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "* haluaa käyttää yhteystietojasi",
        "* wil toegang tot je contacten",
        "A(z) „*” hozzá szeretne férni az Ön kontaktjaihoz.",
        "Aplikace „*“ žádá o přístup k vašim kontaktům",
        "Aplikácia „*“ žiada o prístup ku kontaktom",
        "«*» vil ha tilgang til kontaktene dine",
        "«*» хоче отримати доступ до ваших контактів",
        "« * » souhaite accéder à vos contacts.",
        "Αίτημα από «*» για πρόσβαση στις Επαφές σας",
        "Программа «*» запрашивает доступ к «Контактам».",
        "״*״ מבקש לגשת לאנשי הקשר שלך",
        "يرغب \"*\" بالوصول إلى جهات الاتصال الخاصة بك",
        "‘*’이(가) 사용자의 연락처에 접근하려고 합니다",
        "“*” Deseja Ter Acesso aos Seus Contatos",
        "“*” Ingin Mengakses Kontak Anda",
        "“*” Kişilerinize Erişmek İstiyor",
        "“*” Mahu Mengakses Kenalan Anda",
        "“*” Muốn Truy cập Danh bạ của bạn",
        "“*” Would Like to Access Your Contacts",
        "“*” ar dori să vă acceseze contactele",
        "“*” gostaria de aceder aos seus contactos",
        "“*” quiere acceder a tus contactos",
        "“*” vil bruge dine kontakter",
        "“*” vol accedir als teus contactes",
        "“*” vorrebbe accedere ai tuoi Contatti",
        "“*” želi pristupiti vašim kontaktima",
        "“*” आपके संपर्कों तक पहुँचना चाहता है",
        "“*” ต้องการที่จะเข้าถึงรายชื่อของคุณ",
        "“*”が連絡先へのアクセスを求めています",
        "“*”想访问您的通讯录",
        "”*” begär åtkomst till dina kontakter",
        "„*“ möchte auf deine Kontakte zugreifen",
        "„*” chce uzyskać dostęp do Kontaktów",
        "「*」想要取用聯絡資訊",
        "「*」要取用通訊錄",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.staticTexts.elements(withLabelsLike: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct BluetoothPeripheralAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "* haluaa antaa dataa lähellä oleville Bluetooth-laitteille, vaikka et käyttäisikään appia.",
        "* quiere que los datos estén disponibles para los dispositivos Bluetooth cercanos aunque no estés utilizando la aplicación.",
        "* wil gegevens beschikbaar stellen voor Bluetooth-apparaten in de buurt, ook als je de app niet gebruikt.",
        "A(z) „*” adatokat akar elérhetővé tenni közeli Bluetooth-eszközök számára akkor is, amikor Ön nem használja az alkalmazást.",
        "Aplikace * žádá o povolení ke zpřístupnění dat blízkým Bluetooth zařízením i v čase, kdy ji právě nepoužíváte.",
        "Aplikácia „*“ chce sprístupňovať dáta pre okolité Bluetooth zariadenia, aj keď ju práve nepoužívate.",
        "Mesmo quando não está a ser usado, “*” gostaria de disponibilizar dados a dispositivos Bluetooth que se encontrem por perto.",
        "Program „*” chce udostępniać dane pobliskim urządzeniom Bluetooth, także gdy go nie używasz.",
        "«*» ønsker å gjøre data tilgjengelig for Bluetooth-enheter i nærheten selv om appen ikke er i bruk.",
        "«*» хоче надавати пристроям Bluetooth поблизу доступ до дних, навіть коли ви не вживаєте цю програму.",
        "« * » voudrait rendre des données disponibles aux appareils Bluetooth proches lorsque vous n’utilisez pas cette app.",
        "« * » voudrait rendre les données disponibles auprès des appareils Bluetooth à proximité lorsque vous n’utilisez pas cette app.",
        "Αίτημα από «*» για να καθιστά δεδομένα διαθέσιμα σε κοντινές συσκευές Bluetooth ακόμη κι όταν δεν χρησιμοποιείτε την εφαρμογή.",
        "Программа «*» запрашивает разрешение на предоставление данных ближайшим устройствам с Bluetooth, даже когда Вы не работаете с программой.",
        "״*״ מעוניין לאפשר להתקני Bluetooth קרובים לקבל גישה לנתונים אפילו כשאינך משתמש/ת ביישום.",
        "يرغب \"*\" في إتاحة البيانات إلى أجهزة Bluetooth القريبة حتى عند عدم استخدامك للتطبيق.",
        "사용자가 해당 앱을 사용하고 있지 않을 때에도 ‘*’이(가) Bluetooth 기기 근처에서 데이터를 사용하려고 합니다.",
        "“*” ar dori să pună la dispoziție date dispozitivelor Bluetooth din apropiere chiar și atunci când nu utilizați aplicația.",
        "“*” deseja disponibilizar dados para os dispositivos Bluetooth por perto até mesmo quando você não estiver usando o aplicativo.",
        "“*” ingin membuat data tersedia untuk perangkat Bluetooth di sekitar saat Anda sedang tidak menggunakan app.",
        "“*” mahu menyediakan data kepada peranti Bluetooth berdekatan walaupun anda tidak menggunakan aplikasi.",
        "“*” muốn làm cho dữ liệu khả dụng đối với thiết bị Bluetooth ở gần ngay cả khi bạn không sử dụng ứng dụng.",
        "“*” vil gerne gøre data tilgængelige for Bluetooth-enheder i nærheden, også når du ikke bruger appen.",
        "“*” vol posar les dades a disposició dels dispositius Bluetooth propers fins i tot quan no utilitzis l’aplicació.",
        "“*” vorrebbe rendere disponibili i dati ai dispositivi Bluetooth nelle vicinanze anche quando non è in uso.",
        "“*” would like to make data available to nearby Bluetooth devices even when you’re not using the app.",
        "“*” želi učiniti podatke dostupnima obližnjim Bluetooth uređajima, čak i kad ne koristite aplikaciju.",
        "“*” आस-पास के ब्लूटूथ उपकरणों पर डेटा उपलब्ध कराना चाहता है, भले ही आप ऐप का उपयोग न कर रहे हों।",
        "“*” ต้องการที่จะให้ข้อมูลที่มีกับอุปกรณ์บลูทูธใกล้เคียงแม้ว่าคุณจะไม่ได้ใช้แอพอยู่",
        "“*”, siz uygulamayı kullanmıyorken bile yakındaki Bluetooth aygıtları için verileri kullanılabilir yapmak istiyor.",
        "“*”が近隣のBluetoothデバイスに、Appを使用していないときでもデータ通信することを求めています。",
        "“*”想在您未使用该应用时仍与周围的蓝牙设备交换数据。",
        "”*” vill göra dina data tillgängliga för andra Bluetooth-enheter i närheten, även när du inte använder appen.",
        "„*“ möchte Daten mit Bluetooth-Geräten in der Nähe teilen, auch wenn die App nicht benutzt wird.",
        "「*」想要在未使用 App 時也能讓鄰近的藍牙裝置取得資料。",
        "「*」要在你並非正在使用 App 時也能讓鄰近的藍牙裝置取得資料。",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.staticTexts.elements(withLabelsLike: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct CalendarAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "* haluaa käyttää kalenteriasi",
        "* wil toegang tot je agenda",
        "A(z) „*” hozzá szeretne férni az Ön naptárjához.",
        "Aplikace „*“ žádá o přístup k vašemu kalendáři",
        "Aplikácia „*“ žiada o prístup ku kalendáru",
        "«*» vil ha tilgang til kalenderen din",
        "«*» хоче отримати доступ до вашого календаря",
        "« * » souhaite accéder à votre calendrier.",
        "Αίτημα από «*» για πρόσβαση στο Ημερολόγιό σας",
        "Программа «*» запрашивает доступ к «Календарю».",
        "״*״ מעוניין לגשת ללוח השנה שלך",
        "يرغب \"*\" بالوصول إلى التقويم الخاص بك",
        "‘*’이(가) 사용자의 캘린더에 접근하려고 합니다",
        "“*” Deseja Ter Acesso ao Seu Calendário",
        "“*” Ingin Mengakses Kalender Anda",
        "“*” Mahu Mengakses Kalendar Anda",
        "“*” Muốn Truy cập Lịch của bạn",
        "“*” Takviminize Erişmek İstiyor",
        "“*” Would Like to Access Your Calendar",
        "“*” ar dori să vă acceseze calendarul",
        "“*” gostaria de aceder ao seu calendário",
        "“*” quiere acceder a tu calendario",
        "“*” vil bruge din kalender",
        "“*” vol accedir al teu calendari",
        "“*” vorrebbe accedere al tuo Calendario",
        "“*” želi pristupiti vašem kalendaru",
        "“*” आपके कैलेंडर तक पहुँचना चाहता है",
        "“*” ต้องการที่จะเข้าถึงปฏิทินของคุณ",
        "“*”がカレンダーへのアクセスを求めています",
        "“*”想访问您的日历",
        "”*” begär åtkomst till din kalender",
        "„*“ möchte auf deinen Kalender zugreifen",
        "„*” chce uzyskać dostęp do Kalendarza",
        "「*」想要取用您的行事曆",
        "「*」要取用你的日曆",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.staticTexts.elements(withLabelsLike: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct CallsAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "* haluaa tarjota perinteisen puhelutoiminnon",
        "* vill använda den inbyggda uppringningsfunktionen",
        "* wil de ingebouwde interface voor het gesprek gebruiken",
        "A(z) „*” híváson belüli funkciót szeretne nyújtani",
        "Aplikácia „*“ chce poskytovať natívne hovory",
        "«*» vil bruke den innebygde samtalefunksjonen",
        "«*» хоче забезпечити власний функціонал під час виклику",
        "« * » souhaite apporter une expérience d’appel native.",
        "Αίτημα από «*» για παροχή εγγενούς εμπειρίας κλήσης",
        "Программа «*» запрашивает разрешение предоставить свою штатную телефонную функциональность.",
        "״*״ מעוניין לספק חוויית שימוש מקורית בזמן שיחה",
        "يرغب \"*\" في تقديم تجربة مكالمات أصلية",
        "‘*’이(가) 네이티브 통화를 제공하려고 합니다.",
        "“*” Deseja Oferecer uma Experiência Nativa na Ligação",
        "“*” Ingin Memberikan Pengalaman Dalam Panggilan Asli",
        "“*” Mahu Menyediakan Pengalaman Dalam Panggilan Asli",
        "“*” Would Like to Provide a Native In-Call Experience",
        "“*” ar dori să furnizeze o experiență integrată în cadrul apelului",
        "“*” desidera fornire un'esperienza di chiamata integrata",
        "“*” gostaria de proporcionar uma interface de chamada nativa",
        "“*” muốn Cung cấp Trải nghiệm Trong cuộc gọi Tự nhiên",
        "“*” quiere proporcionar una experiencia nativa durante las llamadas",
        "“*” vil bruge den indbyggede opkaldsfunktion",
        "“*” vol oferir‑te una experiència nativa de trucada",
        "“*” želi pružiti nativno iskustvo poziva.",
        "“*” स्थानीय इन-कॉल अनुभव प्रदान करना चाहेगा",
        "“*” ต้องการที่จะให้การรับสายโทรศัพท์เข้าที่เหมือนจริง",
        "“*”, Özgün Çağrı İçi Deneyimi Sağlamak İstiyor",
        "“*”はネイティブな着信機能を提供しようとしています。",
        "“*”想提供原生通话体验",
        "„*“ möchte integrierte Im-Anruf-Funktionalität ermöglichen",
        "„*“ žádá o povolení k poskytování nativních hovorů",
        "„*” chce oferować natywny interfejs połączenia",
        "「*」想要提供原生通話體驗",
        "「*」要提供整合式來電體驗",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.staticTexts.elements(withLabelsLike: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct CameraAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "* haluaa käyttää kameraa",
        "* wil toegang tot de camera",
        "A(z) „*” hozzá szeretne férni az Ön kamerájához.",
        "Aplikace „*“ žádá o přístup k fotoaparátu",
        "Aplikácia „*“ žiada o prístup ku kamere",
        "«*» vil ha tilgang til kameraet",
        "«*» хоче отримати доступ до Камери",
        "« * » souhaite accéder à l’appareil photo.",
        "Αίτημα από «*» για πρόσβαση στην Κάμερα",
        "Программа «*» запрашивает доступ к «Камере».",
        "״*״ מבקש להשתמש במצלמה",
        "يرغب \"*\" بالوصول إلى الكاميرا الخاصة بك",
        "‘*’이(가) 카메라에 접근하려고 합니다",
        "“*” Deseja Ter Acesso à Câmera",
        "“*” Ingin Mengakses Kamera",
        "“*” Kameraya Erişmek İstiyor",
        "“*” Mahu Mengakses Kamera",
        "“*” Muốn Truy cập Camera",
        "“*” Would Like to Access the Camera",
        "“*” ar dori să acceseze camera",
        "“*” gostaria de aceder à Câmara",
        "“*” quiere acceder a la cámara",
        "“*” vil bruge kameraet",
        "“*” vol accedir a la càmera",
        "“*” vorrebbe accedere alla fotocamera",
        "“*” želi pristupiti kameri",
        "“*” कैमरा तक पहुँचना चाहता है",
        "“*” ต้องการที่จะเข้าถึงกล้อง",
        "“*”がカメラへのアクセスを求めています",
        "“*”想访问您的相机",
        "”*” begär åtkomst till kameran",
        "„*“ möchte auf deine Kamera zugreifen",
        "„*” chce uzyskać dostęp do Aparatu",
        "「*」想要取用您的相機",
        "「*」要取用相機",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.staticTexts.elements(withLabelsLike: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct MediaLibraryAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "'*' wil toegang tot Apple Music en je mediabibliotheek",
        "* haluaa käyttää Apple Musicia ja mediakirjastoasi",
        "* quiere acceder a Apple Music y a tu biblioteca multimedia",
        "A(z) „*” hozzá szeretne férni az Apple Musichoz és az Ön médiakönyvtárához",
        "Aplikace „*“ žádá o povolení k přístupu k Apple Music a vaší knihovně médií",
        "Aplikácia „*“ žiada o prístup k Apple Music a vašej knižnici médií",
        "«*» vil ha tilgang til Apple Music og mediebiblioteket ditt",
        "«*» запрашивает доступ к Apple Music и Вашей Медиатеке",
        "«*» хоче мати доступ до Apple Music і вашої медіатеки",
        "« * » aimerait accéder à Apple Music et à votre bibliothèque multimédia.",
        "« * » souhaite accéder à Apple Music et à votre bibliothèque multimédia.",
        "Αίτημα από «*» για πρόσβαση στο Apple Music και στη Βιβλιοθήκη πολυμέσων σας",
        "يرغب \"*\" في الوصول إلى Apple Music ومكتبة الوسائط",
        "‏“*” מעוניין לגשת ל-Apple Music ולספריית המדיה שלך.",
        "‘*’이(가) Apple Music 및 사용자의 미디어 보관함에 접근하려고 합니다.",
        "“*” Apple Music और आपकी मीडिया लाइब्रेरी तक पहुँचना चाहता है",
        "“*” Deseja Acessar o Apple Music e a sua Biblioteca de Mídia",
        "“*” Ingin Mengakses Apple Music Dan Perpustakaan Media Anda",
        "“*” Mahu Mengakses Apple Music Dan Pustaka Media Anda",
        "“*” Would Like to Access Apple Music And Your Media Library",
        "“*” Would Like to Access Apple Music and Your Media Library",
        "“*” ar dori să acceseze Apple Music și biblioteca dvs. multimedia",
        "“*” desidera accedere ad Apple Music e alla tua libreria di contenuti",
        "“*” gostaria de aceder a Apple Music e à sua biblioteca de multimédia",
        "“*” muốn truy cập Apple Music và thư viện phương tiện của bạn",
        "“*” vil bruge Apple Music og dit mediebibliotek",
        "“*” vol accedir a l’Apple Music i a la biblioteca multimèdia",
        "“*” želi pristupiti Apple Musicu i vašoj glazbenoj medijateci",
        "“*” ต้องการที่จะเข้าถึง Apple Music และคลังสื่อของคุณ",
        "“*”, Apple Music'e ve Ortam Arşivinize Erişmek İstiyor",
        "“*”がApple Musicとメディアライブラリへのアクセスを求めています",
        "“*”想要访问 Apple Music 和您的媒体资料库",
        "”*” vill få tillgång till Apple Music och ditt mediebibliotek",
        "„*“ möchte auf Apple Music und deine Mediathek zugreifen",
        "„*” chce uzyskać dostęp do Apple Music i Twojej biblioteki multimediów",
        "「*」想取用 Apple Music 及你的媒體資料庫",
        "「*」想要取用 Apple Music 和您的媒體資料庫",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.staticTexts.elements(withLabelsLike: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct MicrophoneAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "* haluaa käyttää mikrofonia",
        "* wil toegang tot de microfoon",
        "A(z) „*” hozzá szeretne férni az Ön mikrofonjához.",
        "Aplikace „*“ žádá o přístup k mikrofonu",
        "Aplikácia „*“ žiada o prístup k mikrofónu",
        "«*» vil ha tilgang til mikrofonen",
        "«*» хоче отримати доступ до мікрофона",
        "« * » souhaite accéder au micro.",
        "Αίτημα από «*» για πρόσβαση στο Μικρόφωνο",
        "Программа «*» запрашивает доступ к микрофону.",
        "״*״ מעוניין להשתמש במיקרופון",
        "يرغب \"*\" بالوصول إلى الميكروفون",
        "‘*’이(가) 마이크에 접근하려고 합니다.",
        "“*” Deseja Ter Acesso ao Microfone",
        "“*” Ingin Mengakses Mikrofon",
        "“*” Mahu Mengakses Mikrofon",
        "“*” Mikrofona Erişmek İstiyor",
        "“*” Muốn Truy cập Micrô",
        "“*” Would Like to Access the Microphone",
        "“*” ar dori să acceseze microfonul",
        "“*” gostaria de aceder ao microfone",
        "“*” quiere acceder al micrófono",
        "“*” vil bruge mikrofonen",
        "“*” vol accedir al micròfon",
        "“*” vorrebbe accedere al microfono",
        "“*” želi pristupiti mikrofonu",
        "“*” माइक्रोफ़ोन तक पहुँचना चाहता है",
        "“*” ต้องการที่จะเข้าถึงไมโครโฟน",
        "“*”がマイクへのアクセスを求めています",
        "“*”想访问您的麦克风",
        "”*” begär åtkomst till mikrofonen",
        "„*“ möchte auf das Mikrofon zugreifen",
        "„*” chce uzyskać dostęp do mikrofonu",
        "「*」想要取用您的麥克風",
        "「*」要取用咪高風",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.staticTexts.elements(withLabelsLike: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct MotionAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "* haluaa käyttää liikunta- ja kuntoilutietojasi",
        "* wil toegang tot je bewegings- en fitnessactiviteit",
        "A(z) „*” hozzá szeretne férni az Ön mozgási és fitnesztevékenységéhez",
        "Aplikace „*“ žádá o přístup k vaší pohybové a kondiční aktivitě",
        "Aplikácia „*“ žiada o prístup k pohybovej a fitnes aktivite",
        "«*» vil ha tilgang til bevegelses- og treningsaktiviteten din",
        "«*» хоче отримати доступ до вашої активності Руху і фітнесу",
        "« * » souhaite accéder à vos mouvements et à votre activité physique.",
        "« * » souhaite accéder à vos mouvements et vos activités physiques.",
        "Αίτημα από «*» για πρόσβαση στη Δραστηριότητα κίνησης και άσκησής σας",
        "Программа «*» запрашивает доступ к Вашим данным движения и фитнеса",
        "״*״ מעוניין לגשת אל פעילות התנועה והכושר שלך",
        "يرغب \"*\" في الوصول إلى نشاط الحركة واللياقة الخاصة بك",
        "‘*’이(가) 사용자의 동작 및 피트니스 활동에 접근하려고 합니다",
        "“*” Deseja Ter Acesso às Suas Atividades de Movimento e Preparo Físico",
        "“*” Hareket ve Fitness Etkinliğinize Erişmek İstiyor",
        "“*” Ingin Mengakses Aktivitas Gerakan & Kebugaran Anda",
        "“*” Mahu Mengakses Aktiviti Pergerakan & Kecergasan Anda",
        "“*” Muốn Truy cập Hoạt động Di chuyển & Thể chất của bạn",
        "“*” Would Like to Access Your Motion & Fitness Activity",
        "“*” ar dori să vă acceseze activitatea de mișcare și fitness",
        "“*” desea acceder a tu actividad física y deportiva",
        "“*” desidera accedere ai dati di “Movimento e fitness”",
        "“*” gostaria de aceder à sua atividade física e de fitness.",
        "“*” vil bruge din fysiske aktivitet og din træningsaktivitet",
        "“*” vol accedir a la teva activitat física",
        "“*” želi pristupiti vašim aktivnostima kretanja i kondicije",
        "“*” आपकी चाल और तंदुरुस्ती गतिविधि तक पहुँचना चाहता है",
        "“*” ต้องการที่จะเข้าถึงกิจกรรมการเคลื่อนไหวและฟิตเนสของคุณ",
        "“*”がモーションとフィットネスのアクティビティへのアクセスを求めています",
        "“*”想访问您的活动与体能训练记录",
        "”*” begär åtkomst till din rörelse- och träningsaktivitet",
        "„*“ möchte auf deine Bewegungs- und Fitnessdaten zugreifen",
        "„*” chce uzyskać dostęp do danych o Twoim ruchu i ćwiczeniach",
        "「*」想要取用您的運動與健身記錄",
        "「*」要取用你的「運動與健身」的「健身記錄」",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.staticTexts.elements(withLabelsLike: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct PhotosAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "* haluaa käyttää kuviasi",
        "* wil toegang tot je foto's",
        "A(z) „*” hozzá szeretne férni az Ön fotóihoz.",
        "Aplikace „*“ žádá o přístup k vašim fotografiím",
        "Aplikácia „*“ žiada o prístup k fotkám",
        "«*» vil ha tilgang til bildene dine",
        "«*» хоче отримати доступ до ваших фото",
        "« * » souhaite accéder à vos photos.",
        "Αίτημα από «*» για πρόσβαση στις Φωτογραφίες σας",
        "Программа «*» запрашивает доступ к «Фото».",
        "״*״ מעוניין לגשת לתמונות שלך",
        "يرغب \"*\" بالوصول إلى الصور الخاصة بك",
        "‘*’이(가) 사용자의 사진에 접근하려고 합니다",
        "“*” Deseja Ter Acesso às Suas Fotos",
        "“*” Fotoğraflarınıza Erişmek İstiyor",
        "“*” Ingin Mengakses Foto Anda",
        "“*” Mahu Mengakses Foto Anda",
        "“*” Muốn Truy cập Ảnh của bạn",
        "“*” Would Like to Access Your Photos",
        "“*” ar dori să vă acceseze pozele",
        "“*” gostaria de aceder às suas fotografias",
        "“*” quiere acceder a tus fotos",
        "“*” vil bruge dine fotos",
        "“*” vol accedir a les teves fotos",
        "“*” vorrebbe accedere alle tue Foto",
        "“*” želi pristupiti vašim fotografijama",
        "“*” आपकी तस्वीरों तक पहुँचना चाहता है",
        "“*” ต้องการที่จะเข้าถึงรูปภาพของคุณ",
        "“*”が写真へのアクセスを求めています",
        "“*”想访问您的照片",
        "”*” begär åtkomst till dina bilder",
        "„*“ möchte auf deine Fotos zugreifen",
        "„*” chce uzyskać dostęp do Zdjęć",
        "「*」想要取用您的照片",
        "「*」要取用你的相片",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.staticTexts.elements(withLabelsLike: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct RemindersAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "* haluaa käyttää muistutuksiasi",
        "* wil toegang tot je herinneringen",
        "A(z) „*” hozzá szeretne férni az Ön emlékeztetőihez.",
        "Aplikace „*“ žádá o přístup k vašim připomínkám",
        "Aplikácia „*“ žiada o prístup k pripomienkam",
        "«*» vil ha tilgang til påminnelsene dine",
        "«*» хоче отримати доступ до ваших нагадувань",
        "« * » souhaite accéder à vos rappels.",
        "Αίτημα από «*» για πρόσβαση στις Υπομνήσεις σας",
        "Программа «*» запрашивает доступ к «Напоминаниям».",
        "״*״ מעוניין לגשת למשימות שלך",
        "يرغب \"*\" بالوصول إلى التذكيرات الخاصة بك",
        "‘*’이(가) 사용자의 미리 알림에 접근하려고 합니다",
        "“*” Anımsatıcılarınıza Erişmek İstiyor",
        "“*” Deseja Ter Acesso aos Seus Lembretes",
        "“*” Ingin Mengakses Pengingat Anda",
        "“*” Mahu Mengakses Peringatan Anda",
        "“*” Muốn Truy cập Lời nhắc của bạn",
        "“*” Would Like to Access Your Reminders",
        "“*” ar dori să vă acceseze mementourile",
        "“*” gostaria de aceder aos seus lembretes",
        "“*” quiere acceder a tus recordatorios",
        "“*” vil bruge dine påmindelser",
        "“*” vol accedir als teus recordatoris",
        "“*” vorrebbe accedere ai tuoi Promemoria",
        "“*” želi pristupiti vašim podsjetnicima",
        "“*” आपके रिमाइंडरों तक पहुँचना चाहता है",
        "“*” ต้องการที่จะเข้าถึงเตือนความจำของคุณ",
        "“*”がリマインダーへのアクセスを求めています",
        "“*”想访问您的提醒事项",
        "”*” begär åtkomst till dina påminnelser",
        "„*“ möchte auf deine Erinnerungen zugreifen",
        "„*” chce uzyskać dostęp do Przypomnień",
        "「*」想要取用您的提醒事項",
        "「*」要取用你的提醒事項",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.staticTexts.elements(withLabelsLike: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct SiriAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "* 的部分資料將傳送給 Apple 以處理你的請求。",
        "*: θέλετε να χρησιμοποιείται με το Siri;",
        "*データの一部は、リクエストを処理するためにAppleに送信されます。",
        "A(z) * adatai közül néhány el lesz küldve az Apple-nek az Ön kérelme feldolgozásához.",
        "Adakah Anda Mahu Menggunakan “*” dengan Siri?",
        "Alcuni dati di * verranno inviati ad Apple per elaborare le tue richieste.",
        "Algunes dades de * s’enviaran a Apple per processar les teves peticions.",
        "Algunos de tus datos en * se enviarán a Apple para procesar tus solicitudes.",
        "Alguns dados da aplicação * serão enviados à Apple para processar os seus pedidos.",
        "Alguns dos seus dados de * serão enviados à Apple para processar as solicitações.",
        "Apakah Anda Ingin Menggunakan “*” dengan Siri?",
        "Bạn có muốn sử dụng “*” với Siri không?",
        "Certaines de vos données * seront envoyées à Apple pour traiter vos demandes.",
        "Chcete používať aplikáciu „*“ so Siri?",
        "Chcete „*“ používat se Siri?",
        "Część danych programu * zostanie wysłana do Apple w celu przetworzenia żądań.",
        "Czy chcesz używać „*” z Siri?",
        "Deseja Usar “*” com a Siri?",
        "Doriți să utilizați “* cu Siri?",
        "Einige deiner Daten von * werden an Apple gesendet, um deine Anfragen zu verarbeiten.",
        "Enkele gegevens van * worden naar Apple verstuurd om je verzoeken te verwerken.",
        "Gostaria de usar “*” com Siri?",
        "Haluatko, että * on Sirin käytössä?",
        "İsteklerinizi işlemek için * verilerinizden bazıları Apple’a gönderilir.",
        "Möchtest du „*“ mit Siri benutzen?",
        "Một số dữ liệu * của bạn sẽ được gửi đến Apple để xử lý yêu cầu của bạn.",
        "Neki vaši * podaci poslat će se Appleu radi obrade vaših zahtjeva.",
        "Některá data aplikace * budou odeslána do Apple na pomoc se zpracováním vašich požadavků.",
        "Niektoré dáta aplikácie * budú kvôli spracovaniu vašich žiadostí odoslané do Apple.",
        "Noen av dataene fra * blir sendt til Apple for å behandle forespørslene dine.",
        "Nogle af dine *-data sendes til Apple for at behandle dine anmodninger.",
        "Osa apin * tiedoista lähetetään Applelle pyyntöjesi käsittelyä varten.",
        "Sebagian data * Anda akan dikirimkan ke Apple untuk memproses permintaan Anda.",
        "Sesetengah data * anda akan dihantar kepada Apple untuk memproses permintaan anda.",
        "Siri를 ‘*’에 사용하겠습니까?",
        "Some of your * data will be sent to Apple to process your requests.",
        "Souhaitez-vous utiliser « * » avec Siri?",
        "Souhaitez-vous utiliser « * » avec Siri ?",
        "Szeretné a következőt a Sirivel használni: „*”?",
        "Unele dintre datele * vor fi trimise la Apple pentru a vă procesa solicitările.",
        "Vil du bruge “*” med Siri?",
        "Vil du bruke * med Siri?",
        "Vill du använda * med Siri?",
        "Viss information från * skickas till Apple så att dina instruktioner kan behandlas.",
        "Vols utilitzar “*” amb Siri?",
        "Vuoi utilizzare “*” con Siri?",
        "Wil je * gebruiken met Siri?",
        "Would You Like to Use “*” with Siri?",
        "Želite li koristiti “*” sa Siri?",
        "¿Quieres usar “*” con Siri?",
        "Κάποια από τα δεδομένα σας στην εφαρμογή «*» θα αποστέλλονται στην Apple για επεξεργασία των αιτημάτων σας.",
        "Ви хочете вживати «*» разом із Siri?",
        "Деякі ваші дані * будуть надсилатися до Apple для опрацювання ваших запитів.",
        "Некоторые из Ваших данных * будут отправлены в Apple на обработку запросов.",
        "Хотите использовать «*» с Siri?",
        "האם ברצונך להשתמש ב-״*״ עם Siri?",
        "חלק מהנתונים של * יישלחו אל Apple לצורך עיבוד בקשותיך.",
        "سيتم إرسال بعض بيانات * إلى Apple بهدف معالجة طلباتك.",
        "هل ترغب في استخدام \"*\" مع Siri؟",
        "आपके अनुरोधों को पूरा करने के लिए आपके * का कुछ डेटा Apple को भेजा जाएगा।",
        "क्या आप “*” को Siri के साथ उपयोग करना चाहेंगे?",
        "ข้อมูลของ * บางอย่างจะถูกส่งไปที่ Apple เพื่อดำเนินการตามคำขอของคุณ",
        "คุณต้องการที่จะใช้ “*” กับ Siri หรือไม่",
        "사용자의 요청을 처리하기 위해 사용자의 * 데이터 일부가 Apple에 전송됩니다.",
        "“*” uygulamasını Siri ile kullanmak ister misiniz?",
        "“*”をSiriで使用しますか?",
        "你要透過 Siri 使用「*」嗎？",
        "您的部分“*”数据将发送给 Apple 以处理您的请求。",
        "您的部分「*」資料會傳送給 Apple 來處理您的要求。",
        "您要在「*」上使用 Siri 嗎？",
        "您要通过 Siri 来使用“*”吗？",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.staticTexts.elements(withLabelsLike: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct SpeechRecognitionAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "* haluaa käyttää puheentunnistusta",
        "* wil toegang tot spraakherkenning",
        "A beszédadatok el lesznek küldve az alkalmazásból az Apple-nek a kérelme feldolgozásához. Ez segít az Apple-nek a beszédfelismerési technológiájának fejlesztésében is.",
        "A(z) „*” hozzá szeretne férni a beszédfelismeréshez",
        "Aplikácia „*“ žiada o prístup k rozpoznávaniu reči",
        "Dados de fala deste aplicativo serão enviados à Apple para processar as solicitações. Isso também ajudará a Apple a melhorar sua tecnologia de reconhecimento de fala.",
        "Dane mowy zostaną wysłane do Apple w celu przetworzenia żądań. Pomoże to Apple w udoskonalaniu technologii rozpoznawania mowy.",
        "Data pertuturan daripada aplikasi ini akan dihantar kepada Apple untuk memproses permintaan anda. Ini turut akan membantu Apple meningkatkan teknologi pengecaman pertuturannya.",
        "Data ucapan dari app ini akan dikirimkan ke Apple untuk memproses permintaan Anda. Ini juga akan membantu Apple meningkatkan teknologi pengenalan ucapannya.",
        "Datele vocale din această aplicație vor fi trimise la Apple pentru a vă procesa solicitările. Aceasta va ajuta și la îmbunătățirea tehnologiei de recunoaștere vocală Apple.",
        "Dữ liệu lời nói từ ứng dụng này sẽ được gửi đến Apple để xử lý yêu cầu của bạn. Việc nãy cũng sẽ giúp Apple cải thiện công nghệ nhận dạng lời nói của mình.",
        "I dati vocali di quest'app verranno inviati ad Apple per l'elaborazione delle tue richieste. L'invio dei dati consentirà ad Apple di migliorare la propria tecnologia di riconoscimento vocale.",
        "İsteklerinizi işlemek için bu uygulamadaki konuşma verileri Apple’a gönderilir. Bu aynı zamanda Apple’ın konuşma tanıma teknolojisini geliştirmesine de yardımcı olur.",
        "Les dades de veu d’aquesta aplicació s’enviaran a Apple per processar les teves peticions i perquè Apple pugui millorar la tecnologia de reconeixement de veu.",
        "Les données vocales de cette app seront envoyées à Apple pour traiter vos demandes. Cela permettra aussi à Apple d’améliorer sa technologie de reconnaissance vocale.",
        "Les données vocales recueillies par cette app seront envoyées à Apple pour traiter vos demandes. Cela aidera également Apple à améliorer sa technologie en matière de reconnaissance vocale.",
        "Los datos de voz de esta aplicación se enviarán a Apple para procesar tus solicitudes. Estos datos también ayudan a Apple a mejorar su tecnología de reconocimiento de voz.",
        "Os dados de fala desta aplicação serão enviados à Apple para processar os seus pedidos. Estará igualmente a ajudar a Apple a melhorar a respetiva tecnologia de reconhecimento da fala.",
        "Podaci govora iz ove aplikacije poslat će se Appleu radi obrade vaših zahtjeva. Time će se također pomoći Appleu u poboljšanju tehnologije prepoznavanja govora.",
        "Rečové dáta z tejto aplikácie budú kvôli spracovaniu vašich žiadostí odoslané do Apple a použité aj na vylepšovanie technológie rozpoznávania reči spoločnosti Apple.",
        "Řečová data z této aplikace budou odeslána do Apple na pomoc se zpracováním vašich požadavků a vylepšováním technologie rozpoznávání řeči.",
        "Röstdata från den här appen skickas till Apple så att dina instruktioner kan behandlas. Detta hjälper även Apple att förbättra tekniken för röstigenkänning.",
        "Speech data from this app will be sent to Apple to process your requests. This will also help Apple improve its speech recognition technology.",
        "Spraakgegevens uit deze app worden naar Apple verstuurd om je verzoeken te verwerken. Deze gegevens worden ook gebruikt om de spraakherkenningstechnologie van Apple te verbeteren.",
        "Sprachdaten von dieser App werden an Apple gesendet, um deine Anfragen zu verarbeiten. Außerdem werden sie verwendet, um Apple beim Verbessern der Spracherkennungstechnologie zu unterstützen.",
        "Taledata fra denne appen vil bli sendt til Apple for å behandle forespørslene dine. Dette vil også hjelpe Apple med å forbedre talegjenkjenningsteknologien.",
        "Talegenkendelsesdata fra denne app, sendes til Apple til behandling af dine anmodinger. Det hjælper desuden Apple med at forbedre sin talegenkendelsesteknologi.",
        "Tämän apin puhetiedot lähetetään Applelle pyyntöjesi käsittelyä varten. Tämä auttaa myös Applea parantamaan puheentunnistusteknologiaansa.",
        "«*» vil ha tilgang til talegjenkjenning",
        "«*» хоче отримати доступ до розпізнавання команд",
        "« * » souhaite accéder à la reconnaissance vocale.",
        "Αίτημα από «*» για πρόσβαση στην Αναγνώριση ομιλίας",
        "Τα φωνητικά δεδομένα από αυτήν την εφαρμογή θα αποστέλλονται στην Apple για επεξεργασία των αιτημάτων σας. Αυτό θα βοηθήσει επίσης την Apple να βελτιώσει την τεχνολογία της ως προς την αναγνώριση ομιλίας.",
        "Голосові дані з цієї програми будуть надсилатися до Apple для опрацювання ваших запитів. Це також допоможе Apple вдосконалювати технологію розпізнавання мовлення.",
        "Программа «*» запрашивает доступ к «Распознаванию речи».",
        "Речевые данные из этой программы будут отправлены в Apple на обработку Ваших запросов. Это также поможет Apple в улучшении технологии речевого распознавания.",
        "נתוני דיבור מיישום זה יישלחו אל Apple לצורך עיבוד בקשותיך. הנתונים גם יעזרו ל-Apple לשפר את טכנולוגיית זיהוי הדיבור שלה.",
        "״*״ מעוניין לגשת אל זיהוי הדיבור שלך",
        "سيتم إرسال بيانات الكلام من هذا التطبيق إلى Apple بهدف معالجة طلباتك. كما أن هذا سيساعد Apple على تحسين تقنية التعرف على الكلام.",
        "يرغب \"*\" في الوصول إلى \"التعرف على الكلام\"",
        "आपके अनुरोधों को पूरा करने के लिए इस ऐप से बोली डेटा Apple को भेजा जाएगा। इससे Apple को अपनी बोली पहचान तकनीक को बेहतर बनाने में भी मदद मिलेगी।",
        "ข้อมูลเสียงพูดจากแอพนี้จะถูกส่งไปที่ Apple เพื่อดำเนินการตามคำขอของคุณ การทำงานนี้จะช่วย Apple ปรับปรุงเทคโนโลยีการจดจำเสียงพูดของบริษัทด้วย",
        "사용자의 요청을 처리하기 위해 이 앱의 음성 데이터가 Apple에 전송됩니다. 이는 Apple의 음성 인식 기술 향상에도 도움이 됩니다.",
        "‘*’이(가) 음성 인식에 접근하려고 합니다",
        "“*” Deseja Ter Acesso ao Reconhecimento de Voz",
        "“*” Ingin Mengakses Pengenalan Ucapan",
        "“*” Konuşma Tanımaya Erişmek İstiyor",
        "“*” Mahu Mengakses Pengecaman Pertuturan",
        "“*” Muốn Truy cập Nhận dạng Lời nói",
        "“*” Would Like to Access Speech Recognition",
        "“*” ar dori să acceseze recunoașterea vocală",
        "“*” desidera accedere all'opzione di riconoscimento vocale",
        "“*” gostaria de aceder ao reconhecimento da fala",
        "“*” quiere acceder al reconocimiento de voz",
        "“*” vil bruge talegenkendelse",
        "“*” vol accedir al reconeixement de veu",
        "“*” želi pristupiti prepoznavanju govora",
        "“*” बोली पहचान तक पहुँचना चाहता है",
        "“*” ต้องการที่จะเข้าถึงการจดจำเสียงพูด",
        "“*”が音声認識へのアクセスを求めています",
        "“*”想访问语音识别",
        "”*” begär åtkomst till röstigenkänning",
        "„*“ möchte auf die Spracherkennung zugreifen",
        "„*“ žádá o přístup k rozpoznávání řeči",
        "„*” chce uzyskać dostęp do rozpoznawania mowy",
        "「*」想要取用語音辨識",
        "「*」要取用語音辨識",
        "このAppからの音声データはリクエストを処理するためにAppleに送信されます。また、音声認識技術の向上にも役立てられます。",
        "此 App 的語音識別數據將傳送給 Apple 以處理你的請求。這亦會有助 Apple 改善語音識別技術。",
        "此 App 的語音資料會傳送給 Apple 來處理您的要求。這也可協助 Apple 改進其語音辨識技術。",
        "部分来自此应用的语音数据将发送给 Apple 以处理您的请求。这还将帮助 Apple 改进语音识别技术。",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.staticTexts.elements(withLabelsLike: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct WillowAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "'*' wil toegang tot je woninggegevens",
        "* haluaa käyttää kotitietojasi",
        "A(z) „*” hozzá szeretne férni az Ön Otthon-adataihoz",
        "Aplikace „*“ žádá o přístup k datům vaší domácnosti",
        "Aplikácia „*“ žiada o prístup k dátam domácnosti",
        "«*» vil ha tilgang til hjemmedataene dine",
        "«*» хоче отримати доступ до даних про ваш дім",
        "« * » souhaite accéder aux données locales",
        "« * » souhaite accéder à vos données locales",
        "Αίτημα από «*» για πρόσβαση στα Οικιακά δεδομένα σας",
        "Программа «*» запрашивает доступ к Вашим данным о доме",
        "״*״ מבקש/ת לגשת לנתוני הבית שלך",
        "يرغب \"*\" في الوصول إلى بيانات المنزل الخاصة بك",
        "‘*’이(가) 사용자의 홈 데이터에 접근하려고 합니다",
        "“*” Deseja Ter Acesso aos Seus Dados",
        "“*” Ev Verilerinize Erişmek İstiyor",
        "“*” Ingin Mengakses Data Rumah Anda",
        "“*” Mahu Mengakses Data Rumah Anda",
        "“*” Muốn Truy cập Dữ liệu Nhà của bạn",
        "“*” Would Like to Access Your Home Data",
        "“*” ar dori să vă acceseze datele privind locuința",
        "“*” gostaria de aceder aos dados da sua casa",
        "“*” quiere acceder a tus datos de casa",
        "“*” vil bruge dine hjemmedata",
        "“*” vol accedir a les teves dades domèstiques ",
        "“*” vorrebbe accedere ai dati della tua abitazione",
        "“*” želi pristupiti vašim podacima o domu",
        "“*” आपके होम डेटा तक पहुँचना चाहता है",
        "“*” ต้องการที่จะเข้าถึงข้อมูลที่บ้านของคุณ",
        "“*”がホームデータへのアクセスを求めています",
        "“*”想访问您的住宅数据",
        "”*” begär åtkomst till dina hemdata",
        "„*“ möchte auf deine Hausdaten zugreifen",
        "„*” chce uzyskać dostęp do danych domu",
        "「*」想要取用您的家庭資料",
        "「*」要取用你的住家數據",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.staticTexts.elements(withLabelsLike: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}
