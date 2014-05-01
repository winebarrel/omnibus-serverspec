name "serverspec"
maintainer "HiganWorks LLC"
homepage "higanworks.com"

override :ruby, version: '2.1.1'
override :rubygems, version: '2.2.1'

replaces        "serverspec"
install_path    "/opt/serverspec"

require 'json'
require 'open-uri'
s_versions = JSON.parse(open('https://rubygems.org/api/v1/versions/serverspec.json').read)
s_versions.select! {|r| r.has_key?('number')}

build_version   s_versions.first['number']
build_iteration 1

# creates required build directories
dependency "preparation"

# serverspec dependencies/components
dependency "serverspec"

# version manifest file
dependency "version-manifest"

exclude "\.git*"
exclude "bundler\/git"
