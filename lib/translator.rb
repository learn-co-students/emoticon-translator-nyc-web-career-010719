# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)

  e_hash = {}

  e_hash["get_emoticon"] = {}
  e_hash["get_meaning"] = {}

  emoticons.each do |word, emoticon|
    e_hash["get_emoticon"][emoticon.first] = emoticon.last
    e_hash["get_meaning"][emoticon.last] = word
  end

  return e_hash

end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  emoticon_hash = load_library(file_path)
  jap_emoticon = ""

  emoticon_hash.each do |get_hash, emoticons|
    emoticons.each do |english, japanese|
      if english == emoticon
        jap_emoticon = japanese
      end
    end
  end

  if jap_emoticon == ""
    return "Sorry, that emoticon was not found"
  else
    return jap_emoticon
  end

end



def get_english_meaning(file_path, emoticon)
  # code goes here
  emoticon_hash = load_library(file_path)
  english_meaning = ""

  emoticon_hash.each do |get_hash, meaning_hash|
    meaning_hash.each do |jap_emoticon, en_meaning|
      if jap_emoticon == emoticon
        english_meaning = en_meaning
      end
    end
  end

  if english_meaning == ""
    return "Sorry, that emoticon was not found"
  else
    return english_meaning
  end

end
