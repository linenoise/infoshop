require 'colorize'

desc "Generate thumbnails for asset files."
task :thumbnail do
  puts "Generating thumbnails of archives"

  # Make sure we have an output directory
  unless File.directory?('content/images/thumbnails') 
    puts '   create     '.green + "content/images/thumbnails"
    Dir.mkdir('content/images/thumbnails')
  end
  
  # Go through and thumbnail each PDF cover page
  Dir.entries("content/archives").each do |entry|
    if entry =~ /\.pdf$/
      base_name = entry.gsub(/\.pdf$/,'')
      source_path = "content/archives/#{base_name}.pdf"
      destination_path = "content/images/thumbnails/#{base_name}.png"

      if File.exists?(destination_path) && File.size(destination_path) > 0
        puts '   identical  ' + destination_path
      else
        puts '   create     '.green + destination_path
        system(
              'convert',
              '-thumbnail',
              '200x200',
              source_path + '[0]',
              destination_path
            )
      end
    end
  end
end