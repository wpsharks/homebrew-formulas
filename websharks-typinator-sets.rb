require "formula"

class WebsharksTypinatorSets < Formula
  homepage "https://github.com/websharks/typinator-sets"
  url "https://github.com/websharks/typinator-sets.git", :branch => "master"

  option "with-local", "Symlinks based on local copy of ~/Projects/typinator-sets"

  def install
    prefix.install Dir["*"] # Copy all files.

    local_repo_dir = File.expand_path("~/Projects/typinator-sets")
    typinator_sets_dir = File.expand_path("~/Library/Application Support/Typinator/Sets")

    install_from_dir = "#{prefix}" # Default behavhior.

    if build.with? "local" # From local repo?
      if File.directory? "#{local_repo_dir}"
        install_from_dir = "#{local_repo_dir}"
      end # Only if directory exists.
    end # Use local repo.

    if File.directory? "#{typinator_sets_dir}"
      FileUtils.rm_f "#{typinator_sets_dir}/WebSharks-Abbreviations-Jason.tyset"
      FileUtils.ln_s "#{install_from_dir}/WebSharks-Abbreviations-Jason.tyset", "#{typinator_sets_dir}/WebSharks-Abbreviations-Jason.tyset"
    end

    if File.directory? "#{typinator_sets_dir}"
      FileUtils.rm_f "#{typinator_sets_dir}/WebSharks-Abbreviations-Raam.tyset"
      FileUtils.ln_s "#{install_from_dir}/WebSharks-Abbreviations-Raam.tyset", "#{typinator_sets_dir}/WebSharks-Abbreviations-Raam.tyset"
    end

  end

  test do
  end
end