# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "smartdict-gtk"
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sergey Potapov"]
  s.date = "2012-08-25"
  s.description = "GTK GUI for Smartdict dictionary"
  s.email = "blake131313@gmail.com"
  s.executables = ["smartdict-gtk"]
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "./bin/smartdict-gtk",
    "./lib/smartdict-gtk.rb",
    "./lib/smartdict/gui.rb",
    "./lib/smartdict/gui/about_window.rb",
    "./lib/smartdict/gui/cli.rb",
    "./lib/smartdict/gui/controller.rb",
    "./lib/smartdict/gui/controller/config.rb",
    "./lib/smartdict/gui/export_dialog.rb",
    "./lib/smartdict/gui/export_dialog/format_combo_box.rb",
    "./lib/smartdict/gui/interchange_button.rb",
    "./lib/smartdict/gui/lang_combo_box.rb",
    "./lib/smartdict/gui/main_window.rb",
    "./lib/smartdict/gui/menu_bar.rb",
    "./lib/smartdict/gui/status_bar.rb",
    "./lib/smartdict/gui/status_icon.rb",
    "./lib/smartdict/gui/text_view.rb",
    "./lib/smartdict/gui/text_view/buffer.rb",
    "./lib/smartdict/gui/translate_button.rb",
    "./lib/smartdict/gui/version.rb",
    "./lib/smartdict/gui/word_entry.rb",
    "./lib/smartdict/gui/word_list.rb",
    "GPL-LICENSE.txt",
    "VERSION"
  ]
  s.homepage = "http://smartdict.net"
  s.licenses = ["GPL"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "GTK GUI for Smartdict dictionary"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<smartdict-core>, ["~> 0.1.0"])
      s.add_runtime_dependency(%q<smartdict-icons>, [">= 0"])
      s.add_runtime_dependency(%q<gtk2>, ["= 1.1.2"])
      s.add_runtime_dependency(%q<activesupport>, ["~> 3.2.0"])
      s.add_runtime_dependency(%q<dm-enum>, [">= 0"])
      s.add_runtime_dependency(%q<builder>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.7"])
      s.add_development_dependency(%q<bundler>, ["~> 1.1.2"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<aruba>, ["= 0.4.11"])
    else
      s.add_dependency(%q<smartdict-core>, ["~> 0.1.0"])
      s.add_dependency(%q<smartdict-icons>, [">= 0"])
      s.add_dependency(%q<gtk2>, ["= 1.1.2"])
      s.add_dependency(%q<activesupport>, ["~> 3.2.0"])
      s.add_dependency(%q<dm-enum>, [">= 0"])
      s.add_dependency(%q<builder>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.7"])
      s.add_dependency(%q<bundler>, ["~> 1.1.2"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<aruba>, ["= 0.4.11"])
    end
  else
    s.add_dependency(%q<smartdict-core>, ["~> 0.1.0"])
    s.add_dependency(%q<smartdict-icons>, [">= 0"])
    s.add_dependency(%q<gtk2>, ["= 1.1.2"])
    s.add_dependency(%q<activesupport>, ["~> 3.2.0"])
    s.add_dependency(%q<dm-enum>, [">= 0"])
    s.add_dependency(%q<builder>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.7"])
    s.add_dependency(%q<bundler>, ["~> 1.1.2"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<aruba>, ["= 0.4.11"])
  end
end

