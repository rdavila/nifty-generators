Rails::Generator::Commands::Create.class_eval do
  def insert_after(file, sentinel, line)
    logger.insert "#{line} into #{file}"
    unless options[:pretend]
      gsub_file file, /(#{Regexp.escape(sentinel)})/mi do |match|
        "#{match}\n  #{line}"
      end
    end
  end
end

Rails::Generator::Commands::Destroy.class_eval do
  def insert_after(file, sentinel, line)
    logger.remove "#{line} from #{file}"
    unless options[:pretend]
      gsub_file file, "\n  #{line}", ''
    end
  end
end

Rails::Generator::Commands::List.class_eval do
  def insert_after(file, sentinel, line)
    logger.insert "#{line} into #{file}"
  end
end
