# SucharyPL - oficjalna biblioteka bazy SucharyAPI
Rubyowa biblioteka do pobierania kawałów z ogólnopolskiej bazy SucharyAPI

[![Ruby Version](https://img.shields.io/badge/ruby-2.7%2B-red)](https://www.ruby-lang.org/)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

---

## 🚀 Instalacja
### Za pomocą gem

```bash
gem install sucharyruby
```

### Za pomocą Bundlera

(W pliku Gemfile)
```ruby
gem "sucharyruby"
```

albo w nowym Bundlerze:
(komenda)
```bash
bundle add sucharyruby
```

---

## ⚡ Szybki start
### Pobranie losowego suchara

```ruby
require "sucharyruby"

suchar = Sucharyruby.dajKawal
puts suchar
```

### Pobranie suchara z konkretnej kategorii

```ruby
require "sucharyruby"

# Możesz użyć ciągu znaków:
suchar = Sucharyruby.dajKawal("programowanie")

# Albo użyć stałej z klasy Kategoria:
suchar = Sucharyruby.dajKawal(Sucharyruby::Kategoria::PROGRAMOWANIE)

puts suchar
```

---

## Kategorie
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
- `Sucharyruby::KategoriaError` - Nieprawidłowa kategoria
- `Sucharyruby::ConnectionError` - Problemy z połączeniem (brak internetu, timeout)
- `Sucharyruby::HTTPError` - Błędy serwera (np. 404 dla nieistniejącej kategorii)
- `Sucharyruby::TimeoutError` - Przekroczony limit czasu zapytania

### Przykład obsługi błędów

```ruby
require "sucharyruby"

begin
  suchar = Sucharyruby.dajKawal("programowanie")
  puts suchar
rescue Sucharyruby::ConnectionError
  puts "❌ Błąd połączenia - sprawdź połączenie internetowe!"
rescue Sucharyruby::HTTPError => e
  puts "❌ Błąd serwera: #{e.status} - #{e.message}"
rescue Sucharyruby::KategoriaError => e
  puts "❌ Nieprawidłowa kategoria: #{e.message}"
rescue Sucharyruby::SucharyError => e
  puts "❌ Nieoczekiwany błąd: #{e.message}"
end
```

---

## 📡 API

Biblioteka jest produktem oraz korzysta z oficjalnej bazy SucharyAPI:
🔗 https://sucharyapi.onrender.com

---

## 📝 Licencja

MIT
