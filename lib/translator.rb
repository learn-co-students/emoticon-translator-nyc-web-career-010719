# require modules here
require 'yaml'

def load_library(file_path)
  # code goes here
  library = {"get_meaning" => {}, "get_emoticon" => {} }
  YAML.load_file(file_path).each do |definition, emote_list|
    english, japanese = emote_list
    library["get_emoticon"][english] = japanese
    library["get_meaning"][japanese] = definition
  end
  library
end

def get_japanese_emoticon(file_path, emoji)
  # code goes here
  translation = load_library(file_path)
  translated = translation["get_emoticon"][emoji]
  if translated
    translated
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoji)
  # code goes here
  translation = load_library(file_path)
  translated = translation["get_meaning"][emoji]
  if translated
    translated
  else
    "Sorry, that emoticon was not found"
  end
end
