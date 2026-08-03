# frozen_string_literal: true

require "net/http"
require "json"
require "uri"

require_relative "sucharyruby/version"

module Sucharyruby
  # Kategorie
  class Kategoria
    PROGRAMOWANIE = "programowanie"
    DWUZNACZNE    = "dwuznaczne"
    SZKOLNE       = "szkolne"
    SUCHARY       = "suchary"
    WULGARNE      = "wulgarne"
    CZARNYHUMOR   = "czarnyhumor"
    INNE          = "inne"

    WSZYSTKIE = [
      PROGRAMOWANIE,
      DWUZNACZNE,
      SZKOLNE,
      SUCHARY,
      WULGARNE,
      CZARNYHUMOR,
      INNE
    ].freeze

    def self.poprawna?(kategoria)
      WSZYSTKIE.include?(kategoria.to_s)
    end
  end

  # Customowe błędy
  class SucharyError < StandardError; end
  class KategoriaError < SucharyError; end
  class ConnectionError < SucharyError; end
  class HTTPError < SucharyError
    attr_reader :status
    def initialize(status, wiadomosc)
      @status = status
      super(wiadomosc)
    end
  end
  class TimeoutError < SucharyError; end

  # Główna funkcja
  def self.dajKawal(kategoria = nil)
    if kategoria
      kat_str = kategoria.to_s.downcase
      if not(Kategoria.poprawna?(kat_str))
        raise KategoriaError, "Nieprawidłowa kategoria: #{kategoria}"
      else
        url = "https://sucharyapi.onrender.com/#{kat_str}"
      end
    else
      url = "https://sucharyapi.onrender.com"
    end

    begin
      adres = URI.parse(url)
      http = Net::HTTP.new(adres.host, adres.port)
      http.use_ssl = (adres.scheme == "https")
      http.open_timeout = 6.5
      http.read_timeout = 6.5
      odpowiedz = http.request(Net::HTTP::Get.new(adres))
      if odpowiedz.is_a?(Net::HTTPSuccess)
        dane = JSON.parse(odpowiedz.body)
        zart = dane["tresc"]
        return zart
      else
        raise HTTPError.new(odpowiedz.code.to_i, "Serwer zwrócił kod błędu #{odpowiedz.code}")
      end
    rescue Net::OpenTimeout, Net::ReadTimeout => e
      raise TimeoutError, "Zapytanie przekroczyło limit czasu: #{e.message}"
    rescue SocketError, Errno::ECONNREFUSED => e
      raise ConnectionError, "Błąd połączenia z serwerem: #{e.message}"
    rescue JSON::ParserError => e
      raise SucharyError, "Otrzymano niepoprawny format danych z serwera: #{e.message}"
    end
  end
end
