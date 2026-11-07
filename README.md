# SucharyRuby - oficjalna biblioteka bazy SucharyAPI
Biblioteka Ruby do pobierania kawałów z ogólnopolskiej bazy SucharyAPI

[![Ruby Version](https://img.shields.io/badge/ruby-3.2%2B-red)](https://www.ruby-lang.org/)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

---

## 🚀 Instalacja
### Za pomocą gem
```bash
gem install sucharyruby
```

### Za pomocą Bundlera
```bash
bundle add sucharyruby
```

---

## ⚡ Suchary
### Pobranie losowego suchara
```ruby
require "sucharyruby"

# Pobierz losowy suchar z dowolnej kategorii
suchar = Sucharyruby.dajKawal
puts suchar
```

### Pobranie suchara z konkretnej kategorii
```ruby
require "sucharyruby"

# Pobierz suchar z kategorii "programowanie"
suchar = Sucharyruby.dajKawal("programowanie")
puts suchar
```

### Pobranie większej liczby sucharów
```ruby
require "sucharyruby"

# Pobierz 3 suchary
suchary = Sucharyruby.wieleKawalow(3)
puts suchary

# Funkcja wieleKawalow() zwraca listę (array []) z żartami
```

---

## Masakry
### Pobranie masakry
```ruby
require "sucharyruby"

# Pobierz masakrę
masakra = Sucharyruby.masakra
puts masakra
```

### Pobranie większej liczby masakr
```ruby
require "sucharyruby"

# Pobierz 3 masakry
masakry = Sucharyruby.wieleMasakr(3)
puts masakry

# Funkcja wieleMasakr() zwraca listę (array []) z masakrami
```

---

## Kategorie sucharów
- `"programowanie"` - Suchary o programowaniu
- `"dwuznaczne"` - Suchary dwuznaczne
- `"szkolne"` - Suchary szkolne
- `"suchary"` - Ogólne suchary
- `"wulgarne"` - Suchary wulgarne
- `"czarnyhumor"` - Czarny humor
- `"inne"` - Inne kategorie

---

## 🛡️ Obsługa błędów
Biblioteka rzuca sformalizowane wyjątki, które możesz łatwo obsługiwać:
### Dostępne wyjątki
- `Sucharyruby::SucharyError` - Bazowy wyjątek, rodzic wszystkich błędów z biblioteki
- `Sucharyruby::HTTPError` - Błędy serwera (np. 404 dla nieistniejącej kategorii)
- `Sucharyruby::TimeoutError` - Żądanie przekroczyło limit czasu (6.5s)
- `Sucharyruby::ConnectionError` - Problemy z połączeniem (brak internetu)

---

## 📡 API
Biblioteka jest produktem oraz korzysta z oficjalnej bazy SucharyAPI:
🔗 [https://sucharyapi.onrender.com](https://sucharyapi.onrender.com)

---

## 📝 Licencja
MIT
