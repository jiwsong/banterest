# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf

# To fix the issue with paperclip gem in regards to Windows

module Paperclip 
  class MediaTypeSpoofDetector 
    def spoofed? 
      false 
    end 
  end 
end