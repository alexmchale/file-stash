#!/usr/bin/env ruby

require "time"
require "fileutils"
require "optparse"

class Stash

  def initialize(path)
    @path = File.expand_path(path)
  end

  # Validate all specified files.
  def validate(files)
    rejected_files = files.find_all { |filename| !File.exists? filename }
    if rejected_files.count > 0
      rejected_files.each { |filename| puts "cannot find file: #{filename}" }
      raise "stash not performed"
    end

    self
  end

  # Perform the stash.
  def stash(files, options = {})
    validate files

    node_note  = options[:message] ? " (#{options[:message]})" : ""
    node_name  = Time.now.iso8601 + node_note
    node_path  = File.join(@path, node_name)

    FileUtils.mkdir_p node_path

    ARGV.each do |src|
      dst = File.join(node_path, File.basename(src))
      FileUtils.mv src, dst
    end
  rescue Exception => e
    puts e.message
  end

  # Run the stasher based upon command line options.
  def self.stash!
    opts =
      OptionParser.new do |opts|

        opts.banner = "Usage: stash [options] <files>"

        opts.on("-m", "--message MSG", String, "Note to attach to this stash") do |msg|
          ENV["STASH_MSG"] = msg
        end

        opts.on("-s", "--stash STASH", String, "Path to the stash to use [defaults to STASH_PATH or ~/.stash]") do |stash|
          ENV["STASH_PATH"] = stash
        end

        opts.on_tail("-h", "--help", "Show this message") do
          puts opts
          exit
        end

      end

    opts.parse!

    if ARGV.empty?
      puts opts
      exit
    end

    Stash.new(ENV["STASH_PATH"] || "~/.stash").stash(ARGV, :message => ENV["STASH_MSG"])
  end

end
