require 'rubygems'
require 'bundler/setup'
require 'yaml'
require 'pathname'
require 'socket'
require 'pry'
require 'logger'
require 'settingslogic'
require 'thread'
require 'sinatra'
require 'colored'
require 'json'
require 'webrick'

require_relative 'rubyserv/sinatra/base'
require_relative 'rubyserv/webrick/log'
require_relative 'rubyserv/webrick/httpserver'
require_relative 'rubyserv/helpers'
require_relative 'rubyserv/constants'
require_relative 'rubyserv/database'
require_relative 'rubyserv/configuration'
require_relative 'rubyserv/logger'
require_relative 'rubyserv/matcher'
require_relative 'rubyserv/protocol'
require_relative 'rubyserv/message'
require_relative 'rubyserv/plugin'
require_relative 'rubyserv/irc'
require_relative 'rubyserv/irc/base'
require_relative 'rubyserv/irc/user'
require_relative 'rubyserv/irc/channel'
require_relative 'rubyserv/irc/server'
require_relative 'rubyserv/irc/client'
require_relative 'rubyserv/protocol/ts6'

Dir.glob(RubyServ.root + 'plugins/*/*.rb').each do |plugin|
  load RubyServ.root + plugin
end

module RubyServ
  def self.start!(args)
    RubyServ::IRC.new(RubyServ.config.link, args)
  end
end
