# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "sucharyruby"

puts "=== SucharyPL - Przykłady Użycia ==="

# 1. Losowy suchar
puts "\n1. Losowy suchar:"
puts Sucharyruby.dajKawal

# 2. Suchar z kategorii za pomocą stałej
puts "\n2. Suchar z kategorii (programowanie):"
suchar_dev = Sucharyruby.dajKawal(Sucharyruby::Kategoria::PROGRAMOWANIE)
puts suchar_dev

# 3. Obsługa błędów
puts "\n3. Przykład obsługi błędnej kategorii:"
begin
  Sucharyruby.dajKawal("nieznana_kategoria")
rescue Sucharyruby::KategoriaError => e
  puts "Wyłapano błąd kategorii: #{e.message}"
rescue Sucharyruby::SucharyError => e
  puts "Wyłapano ogólny błąd biblioteki: #{e.message}"
end