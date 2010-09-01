require "rubygems"
require "rake"
require "echoe"

namespace :man do
  Dir["man/*.ronn"].each do |ronn|
    basename = File.basename(ronn, ".ronn")
    roff = "man/#{basename}"

    file roff => ["man", ronn] do
      sh "ronn --roff --pipe #{ronn} > #{roff}"
    end

    file "#{roff}.txt" => roff do
      sh "groff -Wall -mtty-char -mandoc -Tascii #{roff} | col -b > #{roff}.txt"
    end

    task :build => "#{roff}.txt"
  end
end

Echoe.new("file-stash", "0.0.1") do |p|

  p.description              = "A utility to get rid of files that are no longer interesting without deleting them."
  p.url                      = "http://github.com/alexmchale/file-stash"
  p.author                   = "Alex McHale"
  p.email                    = "alexmchale@gmail.com"
  p.ignore_pattern           = %w( tmp/* script/* )
  p.runtime_dependencies     = []
  p.development_dependencies = [ "ronn" ]
  p.require_signed           = true

end
