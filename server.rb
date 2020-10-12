#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
Bundler.require
require 'daemons'

options = {
  app_name: 'airplanes_launcher',
  dir: 'tmp',
  monitor: true,
  backtrace: true,
  log_output: true,
  :logfilename        => 'airplanes_launcher.log',
  :output_logfilename => 'airplanes_launcher_output'
}

Daemons.run(File.join(File.dirname(__FILE__), 'run.rb'), options)
