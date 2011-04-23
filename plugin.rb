
Plugin.define do
  name    "extFileType"
  version "1.0"
  file    "lib", "extfiletype"
  object  "Redcar::ExtFileType"
  dependencies  "application",">0",
                "runnables"  ,">0",
                "ruby"       ,">0"
end
