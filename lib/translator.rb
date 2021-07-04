require "yaml"

def load_library(path)
  return_h =
  {"get_meaning" => {},
  "get_emoticon" => {}}
  emoticons = YAML.load_file(path)
  emoticons.each do |a, b|
    return_h["get_meaning"][b[1]] = a
    return_h["get_emoticon"][b[0]] = b[1]
  end
  return_h
end

def get_japanese_emoticon(path, emoticon)
  result = nil
  handy_dandy_notebook = load_library(path)
  handy_dandy_notebook["get_emoticon"].each do |a, b|
    if emoticon == a
      result = b
    end
  end
  if result == nil
    "Sorry, that emoticon was not found"
  else
    result
  end
end

def get_english_meaning(path, emoticon)
  result = nil
  handy_dandy_notebook = load_library(path)
  handy_dandy_notebook["get_meaning"].each do |a, b|
    if emoticon == a
      result = b
    end
  end
  if result == nil
    "Sorry, that emoticon was not found"
  else
    result
  end
end
