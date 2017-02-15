// swiftlint:disable variable_name trailing_comma
/// Represents possible system service messages and label values on buttons.

import XCTest

extension SystemAlertAllow {
    public static var allow: [String] {
        return [
            "승인",
            "Разрешить",
            "Tamam",
            "ОК",
            "OKE",
            "אישור",
            "OK",
            "ตกลง",
            "موافق",
            "Permitir",
            "好",
            "ठीक",
        ]
    }
}

extension SystemAlertDeny {
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
            "Nemoj dozvoliti",
            "Zakázat",
            "허용 안 함",
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
            "Запретить",
        ]
    }
}

public struct SpeechRecognitionAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "“*” želi pristupiti prepoznavanju govora",
        "Data pertuturan daripada aplikasi ini akan dihantar kepada Apple untuk memproses permintaan anda. Ini turut akan membantu Apple meningkatkan teknologi pengecaman pertuturannya.",
        "“*” Deseja Ter Acesso ao Reconhecimento de Voz",
        "Les données vocales de cette app seront envoyées à Apple pour traiter vos demandes. Cela permettra aussi à Apple d’améliorer sa technologie de reconnaissance vocale.",
        "Data ucapan dari app ini akan dikirimkan ke Apple untuk memproses permintaan Anda. Ini juga akan membantu Apple meningkatkan teknologi pengenalan ucapannya.",
        "“*” Muốn Truy cập Nhận dạng Lời nói",
        "«*» хоче отримати доступ до розпізнавання команд",
        "‘*’이(가) 음성 인식에 접근하려고 합니다",
        "* wil toegang tot spraakherkenning",
        "Röstdata från den här appen skickas till Apple så att dina instruktioner kan behandlas. Detta hjälper även Apple att förbättra tekniken för röstigenkänning.",
        "״*״ מעוניין לגשת אל זיהוי הדיבור שלך",
        "“*” vol accedir al reconeixement de veu",
        "此 App 的語音資料會傳送給 Apple 來處理您的要求。這也可協助 Apple 改進其語音辨識技術。",
        "Podaci govora iz ove aplikacije poslat će se Appleu radi obrade vaših zahtjeva. Time će se također pomoći Appleu u poboljšanju tehnologije prepoznavanja govora.",
        "נתוני דיבור מיישום זה יישלחו אל Apple לצורך עיבוד בקשותיך. הנתונים גם יעזרו ל-Apple לשפר את טכנולוגיית זיהוי הדיבור שלה.",
        "आपके अनुरोधों को पूरा करने के लिए इस ऐप से बोली डेटा Apple को भेजा जाएगा। इससे Apple को अपनी बोली पहचान तकनीक को बेहतर बनाने में भी मदद मिलेगी।",
        "“*” Would Like to Access Speech Recognition",
        "Sprachdaten von dieser App werden an Apple gesendet, um deine Anfragen zu verarbeiten. Außerdem werden sie verwendet, um Apple beim Verbessern der Spracherkennungstechnologie zu unterstützen.",
        "“*” ar dori să acceseze recunoașterea vocală",
        "“*” बोली पहचान तक पहुँचना चाहता है",
        "“*” ต้องการที่จะเข้าถึงการจดจำเสียงพูด",
        "사용자의 요청을 처리하기 위해 이 앱의 음성 데이터가 Apple에 전송됩니다. 이는 Apple의 음성 인식 기술 향상에도 도움이 됩니다.",
        "“*” Ingin Mengakses Pengenalan Ucapan",
        "ข้อมูลเสียงพูดจากแอพนี้จะถูกส่งไปที่ Apple เพื่อดำเนินการตามคำขอของคุณ การทำงานนี้จะช่วย Apple ปรับปรุงเทคโนโลยีการจดจำเสียงพูดของบริษัทด้วย",
        "Os dados de fala desta aplicação serão enviados à Apple para processar os seus pedidos. Estará igualmente a ajudar a Apple a melhorar a respetiva tecnologia de reconhecimento da fala.",
        "„*“ žádá o přístup k rozpoznávání řeči",
        "“*” Mahu Mengakses Pengecaman Pertuturan",
        "「*」想要取用語音辨識",
        "«*» vil ha tilgang til talegjenkjenning",
        "Dane mowy zostaną wysłane do Apple w celu przetworzenia żądań. Pomoże to Apple w udoskonalaniu technologii rozpoznawania mowy.",
        "A beszédadatok el lesznek küldve az alkalmazásból az Apple-nek a kérelme feldolgozásához. Ez segít az Apple-nek a beszédfelismerési technológiájának fejlesztésében is.",
        "Dados de fala deste aplicativo serão enviados à Apple para processar as solicitações. Isso também ajudará a Apple a melhorar sua tecnologia de reconhecimento de fala.",
        "Tämän apin puhetiedot lähetetään Applelle pyyntöjesi käsittelyä varten. Tämä auttaa myös Applea parantamaan puheentunnistusteknologiaansa.",
        "Spraakgegevens uit deze app worden naar Apple verstuurd om je verzoeken te verwerken. Deze gegevens worden ook gebruikt om de spraakherkenningstechnologie van Apple te verbeteren.",
        "“*”想访问语音识别",
        "Голосові дані з цієї програми будуть надсилатися до Apple для опрацювання ваших запитів. Це також допоможе Apple вдосконалювати технологію розпізнавання мовлення.",
        "Речевые данные из этой программы будут отправлены в Apple на обработку Ваших запросов. Это также поможет Apple в улучшении технологии речевого распознавания.",
        "« * » souhaite accéder à la reconnaissance vocale.",
        "“*” vil bruge talegenkendelse",
        "部分来自此应用的语音数据将发送给 Apple 以处理您的请求。这还将帮助 Apple 改进语音识别技术。",
        "Τα φωνητικά δεδομένα από αυτήν την εφαρμογή θα αποστέλλονται στην Apple για επεξεργασία των αιτημάτων σας. Αυτό θα βοηθήσει επίσης την Apple να βελτιώσει την τεχνολογία της ως προς την αναγνώριση ομιλίας.",
        "Αίτημα από «*» για πρόσβαση στην Αναγνώριση ομιλίας",
        "* haluaa käyttää puheentunnistusta",
        "このAppからの音声データはリクエストを処理するためにAppleに送信されます。また、音声認識技術の向上にも役立てられます。",
        "سيتم إرسال بيانات الكلام من هذا التطبيق إلى Apple بهدف معالجة طلباتك. كما أن هذا سيساعد Apple على تحسين تقنية التعرف على الكلام.",
        "Los datos de voz de esta aplicación se enviarán a Apple para procesar tus solicitudes. Estos datos también ayudan a Apple a mejorar su tecnología de reconocimiento de voz.",
        "„*” chce uzyskać dostęp do rozpoznawania mowy",
        "Talegenkendelsesdata fra denne app, sendes til Apple til behandling af dine anmodinger. Det hjælper desuden Apple med at forbedre sin talegenkendelsesteknologi.",
        "“*” quiere acceder al reconocimiento de voz",
        "İsteklerinizi işlemek için bu uygulamadaki konuşma verileri Apple’a gönderilir. Bu aynı zamanda Apple’ın konuşma tanıma teknolojisini geliştirmesine de yardımcı olur.",
        "Speech data from this app will be sent to Apple to process your requests. This will also help Apple improve its speech recognition technology.",
        "Taledata fra denne appen vil bli sendt til Apple for å behandle forespørslene dine. Dette vil også hjelpe Apple med å forbedre talegjenkjenningsteknologien.",
        "Les dades de veu d’aquesta aplicació s’enviaran a Apple per processar les teves peticions i perquè Apple pugui millorar la tecnologia de reconeixement de veu.",
        "“*”が音声認識へのアクセスを求めています",
        "”*” begär åtkomst till röstigenkänning",
        "「*」要取用語音辨識",
        "Datele vocale din această aplicație vor fi trimise la Apple pentru a vă procesa solicitările. Aceasta va ajuta și la îmbunătățirea tehnologiei de recunoaștere vocală Apple.",
        "Les données vocales recueillies par cette app seront envoyées à Apple pour traiter vos demandes. Cela aidera également Apple à améliorer sa technologie en matière de reconnaissance vocale.",
        "Aplikácia „*“ žiada o prístup k rozpoznávaniu reči",
        "“*” gostaria de aceder ao reconhecimento da fala",
        "„*“ möchte auf die Spracherkennung zugreifen",
        "A(z) „*” hozzá szeretne férni a beszédfelismeréshez",
        "Řečová data z této aplikace budou odeslána do Apple na pomoc se zpracováním vašich požadavků a vylepšováním technologie rozpoznávání řeči.",
        "Dữ liệu lời nói từ ứng dụng này sẽ được gửi đến Apple để xử lý yêu cầu của bạn. Việc nãy cũng sẽ giúp Apple cải thiện công nghệ nhận dạng lời nói của mình.",
        "Программа «*» запрашивает доступ к «Распознаванию речи».",
        "此 App 的語音識別數據將傳送給 Apple 以處理你的請求。這亦會有助 Apple 改善語音識別技術。",
        "“*” Konuşma Tanımaya Erişmek İstiyor",
        "يرغب \"*\" في الوصول إلى \"التعرف على الكلام\"",
        "I dati vocali di quest'app verranno inviati ad Apple per l'elaborazione delle tue richieste. L'invio dei dati consentirà ad Apple di migliorare la propria tecnologia di riconoscimento vocale.",
        "“*” desidera accedere all'opzione di riconoscimento vocale",
        "Rečové dáta z tejto aplikácie budú kvôli spracovaniu vašich žiadostí odoslané do Apple a použité aj na vylepšovanie technológie rozpoznávania reči spoločnosti Apple.",
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
        "Szeretné a következőt a Sirivel használni: „*”?",
        "Vil du bruke * med Siri?",
        "Algunes dades de * s’enviaran a Apple per processar les teves peticions.",
        "Noen av dataene fra * blir sendt til Apple for å behandle forespørslene dine.",
        "Möchtest du „*“ mit Siri benutzen?",
        "Vil du bruge “*” med Siri?",
        "Souhaitez-vous utiliser « * » avec Siri?",
        "Haluatko, että * on Sirin käytössä?",
        "Siri를 ‘*’에 사용하겠습니까?",
        "“*” uygulamasını Siri ile kullanmak ister misiniz?",
        "Nogle af dine *-data sendes til Apple for at behandle dine anmodninger.",
        "사용자의 요청을 처리하기 위해 사용자의 * 데이터 일부가 Apple에 전송됩니다.",
        "Neki vaši * podaci poslat će se Appleu radi obrade vaših zahtjeva.",
        "Certaines de vos données * seront envoyées à Apple pour traiter vos demandes.",
        "Souhaitez-vous utiliser « * » avec Siri ?",
        "你要透過 Siri 使用「*」嗎？",
        "Sebagian data * Anda akan dikirimkan ke Apple untuk memproses permintaan Anda.",
        "Apakah Anda Ingin Menggunakan “*” dengan Siri?",
        "“*”をSiriで使用しますか?",
        "क्या आप “*” को Siri के साथ उपयोग करना चाहेंगे?",
        "आपके अनुरोधों को पूरा करने के लिए आपके * का कुछ डेटा Apple को भेजा जाएगा।",
        "คุณต้องการที่จะใช้ “*” กับ Siri หรือไม่",
        "هل ترغب في استخدام \"*\" مع Siri؟",
        "Gostaria de usar “*” com Siri?",
        "Ви хочете вживати «*» разом із Siri?",
        "Algunos de tus datos en * se enviarán a Apple para procesar tus solicitudes.",
        "Vuoi utilizzare “*” con Siri?",
        "Chcete „*“ používat se Siri?",
        "Chcete používať aplikáciu „*“ so Siri?",
        "您的部分「*」資料會傳送給 Apple 來處理您的要求。",
        "سيتم إرسال بعض بيانات * إلى Apple بهدف معالجة طلباتك.",
        "* 的部分資料將傳送給 Apple 以處理你的請求。",
        "Sesetengah data * anda akan dihantar kepada Apple untuk memproses permintaan anda.",
        "Would You Like to Use “*” with Siri?",
        "Einige deiner Daten von * werden an Apple gesendet, um deine Anfragen zu verarbeiten.",
        "Některá data aplikace * budou odeslána do Apple na pomoc se zpracováním vašich požadavků.",
        "חלק מהנתונים של * יישלחו אל Apple לצורך עיבוד בקשותיך.",
        "A(z) * adatai közül néhány el lesz küldve az Apple-nek az Ön kérelme feldolgozásához.",
        "Некоторые из Ваших данных * будут отправлены в Apple на обработку запросов.",
        "*データの一部は、リクエストを処理するためにAppleに送信されます。",
        "Enkele gegevens van * worden naar Apple verstuurd om je verzoeken te verwerken.",
        "Część danych programu * zostanie wysłana do Apple w celu przetworzenia żądań.",
        "ข้อมูลของ * บางอย่างจะถูกส่งไปที่ Apple เพื่อดำเนินการตามคำขอของคุณ",
        "Деякі ваші дані * будуть надсилатися до Apple для опрацювання ваших запитів.",
        "Vols utilitzar “*” amb Siri?",
        "Czy chcesz używać „*” z Siri?",
        "Osa apin * tiedoista lähetetään Applelle pyyntöjesi käsittelyä varten.",
        "האם ברצונך להשתמש ב-״*״ עם Siri?",
        "Adakah Anda Mahu Menggunakan “*” dengan Siri?",
        "Bạn có muốn sử dụng “*” với Siri không?",
        "Želite li koristiti “*” sa Siri?",
        "*: θέλετε να χρησιμοποιείται με το Siri;",
        "Deseja Usar “*” com a Siri?",
        "İsteklerinizi işlemek için * verilerinizden bazıları Apple’a gönderilir.",
        "Alguns dos seus dados de * serão enviados à Apple para processar as solicitações.",
        "您的部分“*”数据将发送给 Apple 以处理您的请求。",
        "您要通过 Siri 来使用“*”吗？",
        "Một số dữ liệu * của bạn sẽ được gửi đến Apple để xử lý yêu cầu của bạn.",
        "Unele dintre datele * vor fi trimise la Apple pentru a vă procesa solicitările.",
        "¿Quieres usar “*” con Siri?",
        "Vill du använda * med Siri?",
        "Some of your * data will be sent to Apple to process your requests.",
        "Alcuni dati di * verranno inviati ad Apple per elaborare le tue richieste.",
        "Alguns dados da aplicação * serão enviados à Apple para processar os seus pedidos.",
        "Viss information från * skickas till Apple så att dina instruktioner kan behandlas.",
        "Niektoré dáta aplikácie * budú kvôli spracovaniu vašich žiadostí odoslané do Apple.",
        "您要在「*」上使用 Siri 嗎？",
        "Wil je * gebruiken met Siri?",
        "Хотите использовать «*» с Siri?",
        "Doriți să utilizați “* cu Siri?",
        "Κάποια από τα δεδομένα σας στην εφαρμογή «*» θα αποστέλλονται στην Apple για επεξεργασία των αιτημάτων σας.",
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
        "“*” quiere acceder a tus recordatorios",
        "“*” gostaria de aceder aos seus lembretes",
        "“*” vorrebbe accedere ai tuoi Promemoria",
        "„*“ möchte auf deine Erinnerungen zugreifen",
        "”*” begär åtkomst till dina påminnelser",
        "״*״ מעוניין לגשת למשימות שלך",
        "“*” ต้องการที่จะเข้าถึงเตือนความจำของคุณ",
        "«*» vil ha tilgang til påminnelsene dine",
        "“*” Ingin Mengakses Pengingat Anda",
        "‘*’이(가) 사용자의 미리 알림에 접근하려고 합니다",
        "Αίτημα από «*» για πρόσβαση στις Υπομνήσεις σας",
        "Программа «*» запрашивает доступ к «Напоминаниям».",
        "「*」要取用你的提醒事項",
        "« * » souhaite accéder à vos rappels.",
        "“*” Deseja Ter Acesso aos Seus Lembretes",
        "“*”想访问您的提醒事项",
        "“*” ar dori să vă acceseze mementourile",
        "“*” Would Like to Access Your Reminders",
        "Aplikácia „*“ žiada o prístup k pripomienkam",
        "* haluaa käyttää muistutuksiasi",
        "“*” vol accedir als teus recordatoris",
        "“*” vil bruge dine påmindelser",
        "A(z) „*” hozzá szeretne férni az Ön emlékeztetőihez.",
        "“*” Mahu Mengakses Peringatan Anda",
        "“*” želi pristupiti vašim podsjetnicima",
        "Aplikace „*“ žádá o přístup k vašim připomínkám",
        "* wil toegang tot je herinneringen",
        "“*” Muốn Truy cập Lời nhắc của bạn",
        "“*” आपके रिमाइंडरों तक पहुँचना चाहता है",
        "“*”がリマインダーへのアクセスを求めています",
        "„*” chce uzyskać dostęp do Przypomnień",
        "「*」想要取用您的提醒事項",
        "“*” Anımsatıcılarınıza Erişmek İstiyor",
        "«*» хоче отримати доступ до ваших нагадувань",
        "يرغب \"*\" بالوصول إلى التذكيرات الخاصة بك",
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
        "“*” vil bruge dine fotos",
        "“*” vorrebbe accedere alle tue Foto",
        "„*“ möchte auf deine Fotos zugreifen",
        "“*” želi pristupiti vašim fotografijama",
        "“*” Mahu Mengakses Foto Anda",
        "“*” Fotoğraflarınıza Erişmek İstiyor",
        "يرغب \"*\" بالوصول إلى الصور الخاصة بك",
        "“*” vol accedir a les teves fotos",
        "Aplikace „*“ žádá o přístup k vašim fotografiím",
        "“*”が写真へのアクセスを求めています",
        "“*” Deseja Ter Acesso às Suas Fotos",
        "«*» vil ha tilgang til bildene dine",
        "Программа «*» запрашивает доступ к «Фото».",
        "Αίτημα από «*» για πρόσβαση στις Φωτογραφίες σας",
        "“*” Ingin Mengakses Foto Anda",
        "A(z) „*” hozzá szeretne férni az Ön fotóihoz.",
        "“*” Muốn Truy cập Ảnh của bạn",
        "* haluaa käyttää kuviasi",
        "”*” begär åtkomst till dina bilder",
        "‘*’이(가) 사용자의 사진에 접근하려고 합니다",
        "“*” आपकी तस्वीरों तक पहुँचना चाहता है",
        "“*”想访问您的照片",
        "„*” chce uzyskać dostęp do Zdjęć",
        "“*” gostaria de aceder às suas fotografias",
        "「*」想要取用您的照片",
        "“*” quiere acceder a tus fotos",
        "״*״ מעוניין לגשת לתמונות שלך",
        "« * » souhaite accéder à vos photos.",
        "Aplikácia „*“ žiada o prístup k fotkám",
        "“*” ar dori să vă acceseze pozele",
        "“*” ต้องการที่จะเข้าถึงรูปภาพของคุณ",
        "* wil toegang tot je foto's",
        "«*» хоче отримати доступ до ваших фото",
        "「*」要取用你的相片",
        "“*” Would Like to Access Your Photos",
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
        "“*” vil bruge kameraet",
        "A(z) „*” hozzá szeretne férni az Ön kamerájához.",
        "“*” Ingin Mengakses Kamera",
        "Αίτημα από «*» για πρόσβαση στην Κάμερα",
        "* haluaa käyttää kameraa",
        "“*”がカメラへのアクセスを求めています",
        "“*” quiere acceder a la cámara",
        "‘*’이(가) 카메라에 접근하려고 합니다",
        "„*“ möchte auf deine Kamera zugreifen",
        "* wil toegang tot de camera",
        "“*” Mahu Mengakses Kamera",
        "“*” vorrebbe accedere alla fotocamera",
        "„*” chce uzyskać dostęp do Aparatu",
        "Aplikácia „*“ žiada o prístup ku kamere",
        "“*” ต้องการที่จะเข้าถึงกล้อง",
        "“*” želi pristupiti kameri",
        "“*” ar dori să acceseze camera",
        "Программа «*» запрашивает доступ к «Камере».",
        "« * » souhaite accéder à l’appareil photo.",
        "Aplikace „*“ žádá o přístup k fotoaparátu",
        "「*」要取用相機",
        "«*» хоче отримати доступ до Камери",
        "“*” gostaria de aceder à Câmara",
        "”*” begär åtkomst till kameran",
        "“*” Muốn Truy cập Camera",
        "يرغب \"*\" بالوصول إلى الكاميرا الخاصة بك",
        "“*”想访问您的相机",
        "“*” Deseja Ter Acesso à Câmera",
        "“*” Kameraya Erişmek İstiyor",
        "«*» vil ha tilgang til kameraet",
        "״*״ מבקש להשתמש במצלמה",
        "“*” vol accedir a la càmera",
        "“*” कैमरा तक पहुँचना चाहता है",
        "“*” Would Like to Access the Camera",
        "「*」想要取用您的相機",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.staticTexts.elements(withLabelsLike: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}

public struct AddressBookAlert: SystemAlert, SystemAlertAllow, SystemAlertDeny {
    public static let messages = [
        "‘*’이(가) 사용자의 연락처에 접근하려고 합니다",
        "“*” vil bruge dine kontakter",
        "Программа «*» запрашивает доступ к «Контактам».",
        "Αίτημα από «*» για πρόσβαση στις Επαφές σας",
        "«*» хоче отримати доступ до ваших контактів",
        "يرغب \"*\" بالوصول إلى جهات الاتصال الخاصة بك",
        "“*” ar dori să vă acceseze contactele",
        "“*” Muốn Truy cập Danh bạ của bạn",
        "“*” Ingin Mengakses Kontak Anda",
        "”*” begär åtkomst till dina kontakter",
        "“*” vorrebbe accedere ai tuoi Contatti",
        "« * » souhaite accéder à vos contacts.",
        "„*“ möchte auf deine Kontakte zugreifen",
        "“*” quiere acceder a tus contactos",
        "* haluaa käyttää yhteystietojasi",
        "“*” Kişilerinize Erişmek İstiyor",
        "「*」要取用通訊錄",
        "Aplikace „*“ žádá o přístup k vašim kontaktům",
        "“*”想访问您的通讯录",
        "* wil toegang tot je contacten",
        "「*」想要取用聯絡資訊",
        "“*” Deseja Ter Acesso aos Seus Contatos",
        "“*” Mahu Mengakses Kenalan Anda",
        "“*” आपके संपर्कों तक पहुँचना चाहता है",
        "“*”が連絡先へのアクセスを求めています",
        "“*” želi pristupiti vašim kontaktima",
        "«*» vil ha tilgang til kontaktene dine",
        "“*” gostaria de aceder aos seus contactos",
        "Aplikácia „*“ žiada o prístup ku kontaktom",
        "“*” Would Like to Access Your Contacts",
        "“*” vol accedir als teus contactes",
        "„*” chce uzyskać dostęp do Kontaktów",
        "״*״ מבקש לגשת לאנשי הקשר שלך",
        "“*” ต้องการที่จะเข้าถึงรายชื่อของคุณ",
        "A(z) „*” hozzá szeretne férni az Ön kontaktjaihoz.",
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
        "«*» запрашивает доступ к Apple Music и Вашей Медиатеке",
        "“*” Deseja Acessar o Apple Music e a sua Biblioteca de Mídia",
        "「*」想要取用 Apple Music 和您的媒體資料庫",
        "„*“ möchte auf Apple Music und deine Mediathek zugreifen",
        "* quiere acceder a Apple Music y a tu biblioteca multimedia",
        "“*” Would Like to Access Apple Music and Your Media Library",
        "“*” želi pristupiti Apple Musicu i vašoj glazbenoj medijateci",
        "“*”, Apple Music'e ve Ortam Arşivinize Erişmek İstiyor",
        "「*」想取用 Apple Music 及你的媒體資料庫",
        "« * » souhaite accéder à Apple Music et à votre bibliothèque multimédia.",
        "« * » aimerait accéder à Apple Music et à votre bibliothèque multimédia.",
        "“*” gostaria de aceder a Apple Music e à sua biblioteca de multimédia",
        "Aplikácia „*“ žiada o prístup k Apple Music a vašej knižnici médií",
        "Aplikace „*“ žádá o povolení k přístupu k Apple Music a vaší knihovně médií",
        "“*” ต้องการที่จะเข้าถึง Apple Music และคลังสื่อของคุณ",
        "“*” muốn truy cập Apple Music và thư viện phương tiện của bạn",
        "'*' wil toegang tot Apple Music en je mediabibliotheek",
        "«*» хоче мати доступ до Apple Music і вашої медіатеки",
        "A(z) „*” hozzá szeretne férni az Apple Musichoz és az Ön médiakönyvtárához",
        "“*” Apple Music और आपकी मीडिया लाइब्रेरी तक पहुँचना चाहता है",
        "‏“*” מעוניין לגשת ל-Apple Music ולספריית המדיה שלך.",
        "“*” Would Like to Access Apple Music And Your Media Library",
        "* haluaa käyttää Apple Musicia ja mediakirjastoasi",
        "“*”想要访问 Apple Music 和您的媒体资料库",
        "“*” vil bruge Apple Music og dit mediebibliotek",
        "“*” vol accedir a l’Apple Music i a la biblioteca multimèdia",
        "Αίτημα από «*» για πρόσβαση στο Apple Music και στη Βιβλιοθήκη πολυμέσων σας",
        "يرغب \"*\" في الوصول إلى Apple Music ومكتبة الوسائط",
        "“*”がApple Musicとメディアライブラリへのアクセスを求めています",
        "“*” Mahu Mengakses Apple Music Dan Pustaka Media Anda",
        "‘*’이(가) Apple Music 및 사용자의 미디어 보관함에 접근하려고 합니다.",
        "“*” desidera accedere ad Apple Music e alla tua libreria di contenuti",
        "“*” ar dori să acceseze Apple Music și biblioteca dvs. multimedia",
        "«*» vil ha tilgang til Apple Music og mediebiblioteket ditt",
        "”*” vill få tillgång till Apple Music och ditt mediebibliotek",
        "„*” chce uzyskać dostęp do Apple Music i Twojej biblioteki multimediów",
        "“*” Ingin Mengakses Apple Music Dan Perpustakaan Media Anda",
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
        "Αίτημα από «*» για να καθιστά δεδομένα διαθέσιμα σε κοντινές συσκευές Bluetooth ακόμη κι όταν δεν χρησιμοποιείτε την εφαρμογή.",
        "“*” želi učiniti podatke dostupnima obližnjim Bluetooth uređajima, čak i kad ne koristite aplikaciju.",
        "Program „*” chce udostępniać dane pobliskim urządzeniom Bluetooth, także gdy go nie używasz.",
        "Aplikace * žádá o povolení ke zpřístupnění dat blízkým Bluetooth zařízením i v čase, kdy ji právě nepoužíváte.",
        "« * » voudrait rendre les données disponibles auprès des appareils Bluetooth à proximité lorsque vous n’utilisez pas cette app.",
        "사용자가 해당 앱을 사용하고 있지 않을 때에도 ‘*’이(가) Bluetooth 기기 근처에서 데이터를 사용하려고 합니다.",
        "“*” would like to make data available to nearby Bluetooth devices even when you’re not using the app.",
        "يرغب \"*\" في إتاحة البيانات إلى أجهزة Bluetooth القريبة حتى عند عدم استخدامك للتطبيق.",
        "* quiere que los datos estén disponibles para los dispositivos Bluetooth cercanos aunque no estés utilizando la aplicación.",
        "״*״ מעוניין לאפשר להתקני Bluetooth קרובים לקבל גישה לנתונים אפילו כשאינך משתמש/ת ביישום.",
        "“*” vorrebbe rendere disponibili i dati ai dispositivi Bluetooth nelle vicinanze anche quando non è in uso.",
        "Программа «*» запрашивает разрешение на предоставление данных ближайшим устройствам с Bluetooth, даже когда Вы не работаете с программой.",
        "“*” vil gerne gøre data tilgængelige for Bluetooth-enheder i nærheden, også når du ikke bruger appen.",
        "“*” ingin membuat data tersedia untuk perangkat Bluetooth di sekitar saat Anda sedang tidak menggunakan app.",
        "«*» ønsker å gjøre data tilgjengelig for Bluetooth-enheter i nærheten selv om appen ikke er i bruk.",
        "“*” आस-पास के ब्लूटूथ उपकरणों पर डेटा उपलब्ध कराना चाहता है, भले ही आप ऐप का उपयोग न कर रहे हों।",
        "Aplikácia „*“ chce sprístupňovať dáta pre okolité Bluetooth zariadenia, aj keď ju práve nepoužívate.",
        "«*» хоче надавати пристроям Bluetooth поблизу доступ до дних, навіть коли ви не вживаєте цю програму.",
        "“*” ar dori să pună la dispoziție date dispozitivelor Bluetooth din apropiere chiar și atunci când nu utilizați aplicația.",
        "“*”, siz uygulamayı kullanmıyorken bile yakındaki Bluetooth aygıtları için verileri kullanılabilir yapmak istiyor.",
        "« * » voudrait rendre des données disponibles aux appareils Bluetooth proches lorsque vous n’utilisez pas cette app.",
        "* haluaa antaa dataa lähellä oleville Bluetooth-laitteille, vaikka et käyttäisikään appia.",
        "「*」想要在未使用 App 時也能讓鄰近的藍牙裝置取得資料。",
        "「*」要在你並非正在使用 App 時也能讓鄰近的藍牙裝置取得資料。",
        "„*“ möchte Daten mit Bluetooth-Geräten in der Nähe teilen, auch wenn die App nicht benutzt wird.",
        "Mesmo quando não está a ser usado, “*” gostaria de disponibilizar dados a dispositivos Bluetooth que se encontrem por perto.",
        "A(z) „*” adatokat akar elérhetővé tenni közeli Bluetooth-eszközök számára akkor is, amikor Ön nem használja az alkalmazást.",
        "“*” deseja disponibilizar dados para os dispositivos Bluetooth por perto até mesmo quando você não estiver usando o aplicativo.",
        "“*” vol posar les dades a disposició dels dispositius Bluetooth propers fins i tot quan no utilitzis l’aplicació.",
        "“*”が近隣のBluetoothデバイスに、Appを使用していないときでもデータ通信することを求めています。",
        "“*” ต้องการที่จะให้ข้อมูลที่มีกับอุปกรณ์บลูทูธใกล้เคียงแม้ว่าคุณจะไม่ได้ใช้แอพอยู่",
        "”*” vill göra dina data tillgängliga för andra Bluetooth-enheter i närheten, även när du inte använder appen.",
        "* wil gegevens beschikbaar stellen voor Bluetooth-apparaten in de buurt, ook als je de app niet gebruikt.",
        "“*” muốn làm cho dữ liệu khả dụng đối với thiết bị Bluetooth ở gần ngay cả khi bạn không sử dụng ứng dụng.",
        "“*” mahu menyediakan data kepada peranti Bluetooth berdekatan walaupun anda tidak menggunakan aplikasi.",
        "“*”想在您未使用该应用时仍与周围的蓝牙设备交换数据。",
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
        "Aplikace „*“ žádá o přístup k mikrofonu",
        "‘*’이(가) 마이크에 접근하려고 합니다.",
        "“*” gostaria de aceder ao microfone",
        "“*” Would Like to Access the Microphone",
        "“*”想访问您的麦克风",
        "「*」想要取用您的麥克風",
        "“*” Deseja Ter Acesso ao Microfone",
        "Программа «*» запрашивает доступ к микрофону.",
        "Αίτημα από «*» για πρόσβαση στο Μικρόφωνο",
        "“*”がマイクへのアクセスを求めています",
        "„*” chce uzyskać dostęp do mikrofonu",
        "“*” ar dori să acceseze microfonul",
        "「*」要取用咪高風",
        "“*” quiere acceder al micrófono",
        "“*” vil bruge mikrofonen",
        "“*” Mahu Mengakses Mikrofon",
        "«*» vil ha tilgang til mikrofonen",
        "“*” želi pristupiti mikrofonu",
        "„*“ möchte auf das Mikrofon zugreifen",
        "* haluaa käyttää mikrofonia",
        "“*” vol accedir al micròfon",
        "« * » souhaite accéder au micro.",
        "״*״ מעוניין להשתמש במיקרופון",
        "«*» хоче отримати доступ до мікрофона",
        "يرغب \"*\" بالوصول إلى الميكروفون",
        "“*” Ingin Mengakses Mikrofon",
        "A(z) „*” hozzá szeretne férni az Ön mikrofonjához.",
        "“*” ต้องการที่จะเข้าถึงไมโครโฟน",
        "“*” vorrebbe accedere al microfono",
        "“*” Mikrofona Erişmek İstiyor",
        "“*” माइक्रोफ़ोन तक पहुँचना चाहता है",
        "* wil toegang tot de microfoon",
        "”*” begär åtkomst till mikrofonen",
        "“*” Muốn Truy cập Micrô",
        "Aplikácia „*“ žiada o prístup k mikrofónu",
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
        "״*״ מעוניין לספק חוויית שימוש מקורית בזמן שיחה",
        "“*” स्थानीय इन-कॉल अनुभव प्रदान करना चाहेगा",
        "«*» хоче забезпечити власний функціонал під час виклику",
        "“*” muốn Cung cấp Trải nghiệm Trong cuộc gọi Tự nhiên",
        "„*” chce oferować natywny interfejs połączenia",
        "“*” desidera fornire un'esperienza di chiamata integrata",
        "“*” Would Like to Provide a Native In-Call Experience",
        "Αίτημα από «*» για παροχή εγγενούς εμπειρίας κλήσης",
        "“*” Ingin Memberikan Pengalaman Dalam Panggilan Asli",
        "“*” Deseja Oferecer uma Experiência Nativa na Ligação",
        "“*” ar dori să furnizeze o experiență integrată în cadrul apelului",
        "「*」要提供整合式來電體驗",
        "Программа «*» запрашивает разрешение предоставить свою штатную телефонную функциональность.",
        "يرغب \"*\" في تقديم تجربة مكالمات أصلية",
        "“*” gostaria de proporcionar uma interface de chamada nativa",
        "“*” vol oferir‑te una experiència nativa de trucada",
        "A(z) „*” híváson belüli funkciót szeretne nyújtani",
        "* haluaa tarjota perinteisen puhelutoiminnon",
        "* vill använda den inbyggda uppringningsfunktionen",
        "« * » souhaite apporter une expérience d’appel native.",
        "“*” želi pružiti nativno iskustvo poziva.",
        "“*” quiere proporcionar una experiencia nativa durante las llamadas",
        "“*”はネイティブな着信機能を提供しようとしています。",
        "„*“ möchte integrierte Im-Anruf-Funktionalität ermöglichen",
        "“*”, Özgün Çağrı İçi Deneyimi Sağlamak İstiyor",
        "‘*’이(가) 네이티브 통화를 제공하려고 합니다.",
        "“*” ต้องการที่จะให้การรับสายโทรศัพท์เข้าที่เหมือนจริง",
        "«*» vil bruke den innebygde samtalefunksjonen",
        "“*” vil bruge den indbyggede opkaldsfunktion",
        "「*」想要提供原生通話體驗",
        "Aplikácia „*“ chce poskytovať natívne hovory",
        "“*”想提供原生通话体验",
        "“*” Mahu Menyediakan Pengalaman Dalam Panggilan Asli",
        "„*“ žádá o povolení k poskytování nativních hovorů",
        "* wil de ingebouwde interface voor het gesprek gebruiken",
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
        "* wil toegang tot je agenda",
        "A(z) „*” hozzá szeretne férni az Ön naptárjához.",
        "“*” Would Like to Access Your Calendar",
        "“*” vorrebbe accedere al tuo Calendario",
        "「*」要取用你的日曆",
        "「*」想要取用您的行事曆",
        "“*” ต้องการที่จะเข้าถึงปฏิทินของคุณ",
        "“*” vol accedir al teu calendari",
        "‘*’이(가) 사용자의 캘린더에 접근하려고 합니다",
        "“*” gostaria de aceder ao seu calendário",
        "Aplikácia „*“ žiada o prístup ku kalendáru",
        "“*” Takviminize Erişmek İstiyor",
        "“*” आपके कैलेंडर तक पहुँचना चाहता है",
        "Αίτημα από «*» για πρόσβαση στο Ημερολόγιό σας",
        "“*” Ingin Mengakses Kalender Anda",
        "„*” chce uzyskać dostęp do Kalendarza",
        "“*” ar dori să vă acceseze calendarul",
        "“*” Deseja Ter Acesso ao Seu Calendário",
        "“*”想访问您的日历",
        "“*” vil bruge din kalender",
        "Программа «*» запрашивает доступ к «Календарю».",
        "״*״ מעוניין לגשת ללוח השנה שלך",
        "« * » souhaite accéder à votre calendrier.",
        "Aplikace „*“ žádá o přístup k vašemu kalendáři",
        "“*” Muốn Truy cập Lịch của bạn",
        "* haluaa käyttää kalenteriasi",
        "”*” begär åtkomst till din kalender",
        "«*» хоче отримати доступ до вашого календаря",
        "“*” želi pristupiti vašem kalendaru",
        "“*” quiere acceder a tu calendario",
        "«*» vil ha tilgang til kalenderen din",
        "“*” Mahu Mengakses Kalendar Anda",
        "يرغب \"*\" بالوصول إلى التقويم الخاص بك",
        "„*“ möchte auf deinen Kalender zugreifen",
        "“*”がカレンダーへのアクセスを求めています",
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
        "„*” chce uzyskać dostęp do danych o Twoim ruchu i ćwiczeniach",
        "„*“ möchte auf deine Bewegungs- und Fitnessdaten zugreifen",
        "“*” vil bruge din fysiske aktivitet og din træningsaktivitet",
        "“*” Deseja Ter Acesso às Suas Atividades de Movimento e Preparo Físico",
        "يرغب \"*\" في الوصول إلى نشاط الحركة واللياقة الخاصة بك",
        "Αίτημα από «*» για πρόσβαση στη Δραστηριότητα κίνησης και άσκησής σας",
        "Aplikácia „*“ žiada o prístup k pohybovej a fitnes aktivite",
        "“*”想访问您的活动与体能训练记录",
        "“*” vol accedir a la teva activitat física",
        "‘*’이(가) 사용자의 동작 및 피트니스 활동에 접근하려고 합니다",
        "「*」要取用你的「運動與健身」的「健身記錄」",
        "“*” gostaria de aceder à sua atividade física e de fitness.",
        "“*” ต้องการที่จะเข้าถึงกิจกรรมการเคลื่อนไหวและฟิตเนสของคุณ",
        "“*” ar dori să vă acceseze activitatea de mișcare și fitness",
        "「*」想要取用您的運動與健身記錄",
        "* haluaa käyttää liikunta- ja kuntoilutietojasi",
        "« * » souhaite accéder à vos mouvements et vos activités physiques.",
        "“*” Hareket ve Fitness Etkinliğinize Erişmek İstiyor",
        "“*” Would Like to Access Your Motion & Fitness Activity",
        "“*” Mahu Mengakses Aktiviti Pergerakan & Kecergasan Anda",
        "“*” desea acceder a tu actividad física y deportiva",
        "“*” desidera accedere ai dati di “Movimento e fitness”",
        "“*” Muốn Truy cập Hoạt động Di chuyển & Thể chất của bạn",
        "« * » souhaite accéder à vos mouvements et à votre activité physique.",
        "* wil toegang tot je bewegings- en fitnessactiviteit",
        "“*” Ingin Mengakses Aktivitas Gerakan & Kebugaran Anda",
        "“*” आपकी चाल और तंदुरुस्ती गतिविधि तक पहुँचना चाहता है",
        "״*״ מעוניין לגשת אל פעילות התנועה והכושר שלך",
        "A(z) „*” hozzá szeretne férni az Ön mozgási és fitnesztevékenységéhez",
        "“*”がモーションとフィットネスのアクティビティへのアクセスを求めています",
        "«*» vil ha tilgang til bevegelses- og treningsaktiviteten din",
        "“*” želi pristupiti vašim aktivnostima kretanja i kondicije",
        "Программа «*» запрашивает доступ к Вашим данным движения и фитнеса",
        "Aplikace „*“ žádá o přístup k vaší pohybové a kondiční aktivitě",
        "”*” begär åtkomst till din rörelse- och träningsaktivitet",
        "«*» хоче отримати доступ до вашої активності Руху і фітнесу",
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
        "‘*’이(가) 사용자의 홈 데이터에 접근하려고 합니다",
        "„*“ möchte auf deine Hausdaten zugreifen",
        "「*」要取用你的住家數據",
        "A(z) „*” hozzá szeretne férni az Ön Otthon-adataihoz",
        "Aplikácia „*“ žiada o prístup k dátam domácnosti",
        "Aplikace „*“ žádá o přístup k datům vaší domácnosti",
        "« * » souhaite accéder à vos données locales",
        "„*” chce uzyskać dostęp do danych domu",
        "“*” Deseja Ter Acesso aos Seus Dados",
        "“*” ar dori să vă acceseze datele privind locuința",
        "”*” begär åtkomst till dina hemdata",
        "* haluaa käyttää kotitietojasi",
        "Αίτημα από «*» για πρόσβαση στα Οικιακά δεδομένα σας",
        "“*” vol accedir a les teves dades domèstiques ",
        "“*” vorrebbe accedere ai dati della tua abitazione",
        "「*」想要取用您的家庭資料",
        "“*” Mahu Mengakses Data Rumah Anda",
        "«*» хоче отримати доступ до даних про ваш дім",
        "“*” želi pristupiti vašim podacima o domu",
        "«*» vil ha tilgang til hjemmedataene dine",
        "“*” quiere acceder a tus datos de casa",
        "Программа «*» запрашивает доступ к Вашим данным о доме",
        "يرغب \"*\" في الوصول إلى بيانات المنزل الخاصة بك",
        "“*”がホームデータへのアクセスを求めています",
        "“*” ต้องการที่จะเข้าถึงข้อมูลที่บ้านของคุณ",
        "« * » souhaite accéder aux données locales",
        "“*” Ingin Mengakses Data Rumah Anda",
        "“*” Would Like to Access Your Home Data",
        "“*” Ev Verilerinize Erişmek İstiyor",
        "״*״ מבקש/ת לגשת לנתוני הבית שלך",
        "“*” gostaria de aceder aos dados da sua casa",
        "“*” vil bruge dine hjemmedata",
        "“*” Muốn Truy cập Dữ liệu Nhà của bạn",
        "“*”想访问您的住宅数据",
        "'*' wil toegang tot je woninggegevens",
        "“*” आपके होम डेटा तक पहुँचना चाहता है",
    ]
    public var alert: XCUIElement

    public init?(element: XCUIElement) {
        guard let _ = element.staticTexts.elements(withLabelsLike: type(of: self).messages).first else {
            return nil
        }

        self.alert = element
    }
}
