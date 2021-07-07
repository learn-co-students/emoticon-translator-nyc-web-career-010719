require 'yaml'

def load_library (file_path)

  emoticon_hash = {}
  emoticon_hash["get_meaning"] = {}
  emoticon_hash["get_emoticon"] = {}
  emoticon_file = YAML.load_file(file_path)
  emoticon_file.each do |emoticon_text, emoticon_icons_array|
      english, japanese = emoticon_icons_array
      emoticon_hash["get_emoticon"][english] = japanese
      emoticon_hash["get_meaning"][japanese] = emoticon_text
    emoticon_hash
  end
  emoticon_hash
end

def get_japanese_emoticon (file_path, emoticon)
  emoticon_hash = load_library(file_path)
  emoticon_hash["get_emoticon"][emoticon] ? emoticon_hash["get_emoticon"][emoticon] : "Sorry, that emoticon was not found"
end

def get_english_meaning (file_path, emoticon)
    emoticon_hash = load_library(file_path)
    emoticon_hash["get_meaning"][emoticon] ? emoticon_hash["get_meaning"][emoticon] : "Sorry, that emoticon was not found"
end
