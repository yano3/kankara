require 'pinject'

base_image = "rubylang/ruby:2.7.5-bionic"

image = Pinject::Docker.new(base_image, log: true)

inject_image = image.inject_build("local/pinjected")

