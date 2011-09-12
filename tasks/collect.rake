require 'colorize'
require 'yaml'

desc "Generate .zip files for collections."
task :collect do
  puts "Generating .zip files for collections"

  # Make sure we have an output directory
  if File.directory?('content/collections')
    Dir.entries("content/collections").each do |entry|

      # Load each YAML file
      if entry =~ /\.yaml$/
        base_name = entry.gsub(/\.yaml$/,'')
        source_path = "content/collections/#{base_name}.yaml"
        destination_path = "content/collections/#{base_name}.zip"
        
        # If a corresponding zip file exists, remove it
        if File.exists?(destination_path)
          puts "Removing old #{destination_path}".yellow
          File.unlink(destination_path)
        end
        
        # Get the list of files to archive
        metadata = YAML::load(File.open(source_path))
        #puts metadata.inspect
        puts metadata['archives'].map{|file| "content/archives/#{file}"}.join("\n")
        
        if metadata && metadata['archives']
          `zip -j -q \"#{destination_path}\" #{metadata['archives'].map{|file| "\"content/archives/#{file}\""}.join(' ')}`
          puts "Collection created: #{destination_path}".green
        else
          puts "Invalid metadata in #{source_path}".red
        end
        
      end
    end
  end
end