require 'formula'

class WebsharksOsa < Formula
  version "150131"
  homepage "https://github.com/websharks/osa"
  url "https://github.com/websharks/osa.git"
  sha1 "5449db480c6154d69e8614f66fe06525fbd2b7b4"

  def install
    prefix.install Dir["*"] # Install files.

    script_libraries_dir = File.expand_path("~/Library/Script Libraries")
    typinator_scripts_dir1 = File.expand_path("~/Typinator/Includes/Scripts")
    typinator_scripts_dir2 = File.expand_path("~/Library/Application Support/Typinator/Sets/Includes/Scripts")

    if !File.directory? "#{script_libraries_dir}"
      mkdir "#{script_libraries_dir}"
    end # Make this directory if it does not exist yet.
    
    ln_s "#{prefix}", "#{script_libraries_dir}/websharks", :force => true

    if File.directory? "#{typinator_scripts_dir1}"
      ln_s "#{prefix}/scripts/typinator.bash", "#{typinator_scripts_dir1}/runOSA", :force => true
    end
    if File.directory? "#{typinator_scripts_dir2}"
      ln_s "#{prefix}/scripts/typinator.bash", "#{typinator_scripts_dir2}/runOSA", :force => true
    end
  end

  test do
  end
end
