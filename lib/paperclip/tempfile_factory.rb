module Paperclip
  class TempfileFactory

    def generate(name = random_name)
      @name = name
      if ENV['PAPERCLIP_CUSTOM_TMP_PATH']
        file = Tempfile.new([basename, extension], ENV['PAPERCLIP_CUSTOM_TMP_PATH'])
      else
        file = Tempfile.new([basename, extension])
      end
      file.binmode
      file
    end

    def extension
      File.extname(@name)
    end

    def basename
      Digest::MD5.hexdigest(File.basename(@name, extension))
    end

    def random_name
      SecureRandom.uuid
    end
  end
end
