(deffacts startup
   (state init))

(defrule ask-os
   ?f <- (state init)
   =>
   (retract ?f)
   (printout t "Предпочитаете iOS вместо Android? (yes/no): ")
   (assert (ios (read))))

(defrule ask-budget-ios
   (ios yes)
   =>
   (printout t "Бюджет на покупку не ограничен? (yes/no): ")
   (assert (rich (read))))

(defrule ask-budget-android
   (ios no)
   =>
   (printout t "Вам нужна продвинутая камера? (yes/no): ")
   (assert (camera (read))))

(defrule res-iphone-pro
   (rich yes) => (printout t "=> РЕЗУЛЬТАТ: iPhone 17 Pro Max" crlf))

(defrule res-iphone-base
   (rich no) => (printout t "=> РЕЗУЛЬТАТ: iPhone 16" crlf))

(defrule res-pixel
   (camera yes) => (printout t "=> РЕЗУЛЬТАТ: Google Pixel 8" crlf))

(defrule res-poco
   (camera no) => (printout t "=> РЕЗУЛЬТАТ: Poco F5" crlf))

; Защита от некорректного ввода
(defrule bad-input
   (or (ios ?ans&~yes&~no) (rich ?ans&~yes&~no) (camera ?ans&~yes&~no))
   =>
   (printout t "=> ОШИБКА: Допустим ввод только 'yes' или 'no'. Наберите (reset) и (run) для повтора." crlf))
   
